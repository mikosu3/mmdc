class EmmRegistService
  class << self
    # emm情報を保存する
    def save_emm(file, video, index)
      emm = Emm.new()
      emm.video = video

      #ファイル名設定
      emm.original_name = file.original_filename
      emm.save_file_name = video.user_id.to_s + "_"+  Time.now.strftime("%Y%m%d%H%M%S") + "_" + index.to_s + File.extname(file.original_filename)

      #ファイルコピー
      copy_file(file, emm.save_file_name)
      emm.save

      #MMDオブジェクト情報を登録
      analyze_emm(get_save_file_path + emm.save_file_name, emm)
    end

    # emmファイルを解析し、登録する
    def analyze_emm(file, emm)
      ini = IniFile.load(file, :encoding => "UTF-8")
      targets = ["Object", "Effect"]

      # emmから欲しいセクションのみ登録する
      targets.each do |target|
        emm_hash = ini[target].to_h
        emm_hash.each do | key, item|
          item = ''+ item.to_s
          item.strip
          
          # 全角の#を半角に戻す
          item.gsub!("＃", "#")
          
          unless item.empty? or item == "none" or item == 'true' or item == 'false'
            createMmdObject(emm, item)
          end
        end
      end
    end

    # 取得したini情報1行から欲しい項目を取得する
    def createMmdObject(emm, infostr)
      mmd = MmdObject.new
      mmd.emm = emm

      #フルパス
      mmd.full_path = infostr

      #拡張子
      mmd.extension = File.extname(infostr).gsub('.', '')

      #ファイル名
      mmd.file_name = File.basename(infostr)

      #フォルダ名
      mmd.folder_name = File.dirname(infostr).split("/").last

      # 解析に失敗したものはスルー
      if mmd.extension.present? && mmd.file_name.present? && mmd.folder_name.present?
        #同動画 同emmで同じものが登録されているか
        v = Video.joins({:emm =>:mmd_object}).find_by(id:emm.video.id, emms:{id: emm.id},  mmd_objects:{folder_name: mmd.folder_name, file_name: mmd.file_name})
        unless v
          mmd.save

          # wantedになる場合は登録
          if is_wanted(mmd.file_name, mmd.folder_name)
            createWanted(mmd)
          end
        end
      else
        Rails.logger.warn("emm解析失敗 #{infostr} #{mmd}")
      end
    end


    # wanted登録
    def createWanted(mmd)

      unless Wanted.find_by(folder_name: mmd.folder_name, file_name: mmd.file_name)
        wanted = Wanted.new
        wanted.folder_name = mmd.folder_name
        wanted.file_name = mmd.file_name
        wanted.extension = mmd.extension
        wanted.save
      end

    end


    #3人以上が同じファイルを使っている場合はwanted
    def is_wanted(file_name, folder_name)

      query = <<-SQL
        SELECT
          COUNT(DISTINCT user_id) as cnt
          FROM
              videos
                  JOIN emms
                      ON (videos.id = emms.video_id)
                  JOIN mmd_objects
                      ON (emms.id = mmd_objects.emm_id)
          WHERE
              mmd_objects.file_name = :file_name
              AND mmd_objects.folder_name = :folder_name
          GROUP BY
              mmd_objects.file_name
              ,mmd_objects.folder_name;
      SQL

      #プレースホルダ
      sql = ActiveRecord::Base.send(
        :sanitize_sql_array,
        [query,file_name: file_name, folder_name: folder_name]
      )

      #3人以上か
      cnt = ActiveRecord::Base.connection.select_one(sql)
      return cnt['cnt'] >= 3
    end

    # ファイル内のパス区切り文字を変更し、コピーする
    def copy_file(file, savefile_name)
      s = File.read(file.tempfile, encoding: 'Windows-31J:UTF-8')
      s.gsub!("\\" , "/");
      
      # #を全角にしてお茶を濁す
      s.gsub!("#", "＃")
      File.write(get_save_file_path + savefile_name, s)
    end

    # アップされたemmファイルの保存先
    def get_save_file_path
      return Rails.application.secrets.save_dir_path
    end
  end
end