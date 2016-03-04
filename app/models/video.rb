class Video < ActiveRecord::Base

  attr_accessor :total
  attr_accessor :resolveds
  attr_accessor :yets
  attr_accessor :wants

  validates :name, presence: true
  validates :name, length: { maximum: 100 }
  has_many :emm

  paginates_per 15

  # 1動画で使用したオブジェクト数
  def self.set_total(video, emm_id = nil)
    query = <<-SQL
      SELECT
              *
          FROM
              (
                  SELECT
                          COUNT(*) AS total
                      FROM
                          (
                              SELECT
                                      mmd_objects.file_name
                                      ,mmd_objects.folder_name
                                      ,mmd_objects.extension
                                  FROM
                                      videos
                                          JOIN emms
                                              ON (videos.id = emms.video_id)
                                          JOIN mmd_objects
                                              ON (emms.id = mmd_objects.emm_id)
                                  WHERE
                                      videos.id = :id #{ unless emm_id.nil? then 'and emms.id = :emm_id' end }
                                      AND is_show = true
                                  GROUP BY
                                      file_name
                                      ,folder_name
                                      ,extension
                          ) AS A
              ) AS total
              ,(
                  SELECT
                          COUNT(*) AS yets
                      FROM
                          (
                              (
                                  SELECT
                                          mmd_objects.file_name
                                          ,mmd_objects.folder_name
                                          ,mmd_objects.extension
                                      FROM
                                          videos
                                              JOIN emms
                                                  ON (videos.id = emms.video_id)
                                              JOIN mmd_objects
                                                  ON (emms.id = mmd_objects.emm_id)
                                              LEFT OUTER JOIN wanteds
                                                  ON (
                                                      wanteds.file_name = mmd_objects.file_name
                                                      AND wanteds.folder_name = mmd_objects.folder_name
                                                      AND wanteds.extension = mmd_objects.extension
                                                  )
                                      WHERE
                                          videos.id = :id #{ unless emm_id.nil? then 'and emms.id = :emm_id' end }
                                          AND is_show = true
                                          AND wanteds.id IS null
                                      GROUP BY
                                          file_name
                                          ,folder_name
                                          ,extension
                              ) AS B
                          )
              ) AS yet
              ,(
                  SELECT
                          COUNT(*) AS wants
                      FROM
                          (
                              SELECT
                                      mmd_objects.file_name
                                      ,mmd_objects.folder_name
                                      ,mmd_objects.extension
                                  FROM
                                      videos
                                          JOIN emms
                                              ON (videos.id = emms.video_id)
                                          JOIN mmd_objects
                                              ON (emms.id = mmd_objects.emm_id)
                                          JOIN wanteds
                                              ON (
                                                  wanteds.file_name = mmd_objects.file_name
                                                  AND wanteds.folder_name = mmd_objects.folder_name
                                                  AND wanteds.extension = mmd_objects.extension
                                              )
                                  WHERE
                                      videos.id = :id #{ unless emm_id.nil? then 'and emms.id = :emm_id' end }
                                      AND is_show = true
                                  GROUP BY
                                      file_name
                                      ,folder_name
                                      ,extension
                          ) AS C
              ) AS want
              ,(
                  SELECT
                          COUNT(*) AS resolveds
                      FROM
                          (
                              SELECT
                                      mmd_objects.file_name
                                      ,mmd_objects.folder_name
                                      ,mmd_objects.extension
                                  FROM
                                      videos
                                          JOIN emms
                                              ON (videos.id = emms.video_id)
                                          JOIN mmd_objects
                                              ON (emms.id = mmd_objects.emm_id)
                                          JOIN wanteds
                                              ON (
                                                  wanteds.file_name = mmd_objects.file_name
                                                  AND wanteds.folder_name = mmd_objects.folder_name
                                                  AND wanteds.extension = mmd_objects.extension
                                              )
                                          JOIN credits
                                              ON (wanteds.id = credits.wanted_id)
                                  WHERE
                                      videos.id = :id #{ unless emm_id.nil? then 'and emms.id = :emm_id' end }
                                      AND is_show = true
                                  GROUP BY
                                      file_name
                                      ,folder_name
                                      ,extension
                          ) AS D
              ) AS resolveds;
    SQL

    #プレースホルダ
    sql = ActiveRecord::Base.send(
      :sanitize_sql_array,
      [query,id: video.id, emm_id: emm_id]
    )

    cnt = ActiveRecord::Base.connection.select_one(sql)
    video.yets = cnt['yets']
    video.total = cnt['total']
    video.resolveds = cnt['resolveds']
    video.wants = cnt['wants']

  end

  # DL用zipファイルを作成する
  def self.create_dl_zip(id)
    zipfile_name = "#{Rails.root}/tmp/#{id}_#{Time.now.strftime('%Y%m%d%H%M%S%N')}.zip"

    # 必須データ取得
    musts = Must.all

    csv = create_csv(id, musts)
    tree_txt = create_tree_txt(id, musts)

    # csvとツリー用テキスト作成
    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      if(zipfile.find_entry("credit.csv") == nil)
        zipfile.add("credit.csv", csv)
      end

      if(zipfile.find_entry("tree.txt") == nil)
        zipfile.add("tree.txt", tree_txt)
      end
    end

    #一時ファイル削除
    FileUtils.rm([csv, tree_txt])

    return zipfile_name
  end

  # コンテンツツリー登録用テキストファイル
  def self.create_tree_txt(id, musts)
    file_path = "#{Rails.root}/tmp/#{id}_#{Time.now.strftime('%Y%m%d%H%M%S%N')}.txt"
    dists = []

    # 必須項目
    musts.each do |row|
      dists.push row['video']
    end

    # データ取得
    get_three_info(id).each do |row|
      dists.push row['distribution']
    end

    # 10個ごとに分割
    text_data = []
    dists.each_slice(10) do |str|
      text_data.push str.join(' ')
    end

    File.write(file_path, text_data.join("\n"))

    return file_path
  end

  # DLクレジット情報csv作成
  def self.create_csv(id, musts)
    file_path = "#{Rails.root}/tmp/#{id}_#{Time.now.strftime('%Y%m%d%H%M%S%N')}.csv"
    csv_data = get_dl_video_info id

    CSV.open(file_path, "a:Windows-31J", :headers => csv_column_names, :write_headers => true) do |file|

      # 必須項目
      musts.each do |row|
        file << [row['name'], row['author_name'], row['video'], '', '○']
      end

      # 動画で使用したデータ
      csv_data.each do |row|
        file << [row['model_name'], row['disp_name'], row['distribution'], row['extension'], row['status']]
      end
    end

    return file_path
  end

  # csvカラム名
  def self.csv_column_names
    ["名前","作者","配布先","拡張子","ステータス"]
  end

  # DL用モデルデータ取得
  def self.get_dl_video_info(id)
    query = <<-SQL
      SELECT
              COALESCE(credits.name, mmd_objects.file_name) AS model_name
              ,authors.disp_name
              ,credits.distribution
              ,mmd_objects.extension
              ,IF (
                  credits.name IS null
                  ,'×'
                  ,'○'
              ) AS status
          FROM
              videos
                  JOIN emms
                      ON (videos.id = emms.video_id)
                  JOIN mmd_objects
                      ON (emms.id = mmd_objects.emm_id)
                  LEFT OUTER JOIN wanteds
                      ON (
                          wanteds.file_name = mmd_objects.file_name
                          AND wanteds.folder_name = mmd_objects.folder_name
                          AND wanteds.extension = mmd_objects.extension
                      )
                  LEFT OUTER JOIN credits
                      ON (wanteds.id = credits.wanted_id)
                  LEFT OUTER JOIN authors_credits
                      ON (credits.id = authors_credits.credit_id)
                  LEFT OUTER JOIN authors
                      ON (authors.id = authors_credits.author_id)
          WHERE
              videos.id = :id
              AND is_show = true
          GROUP BY
              model_name
              ,disp_name
              ,distribution
          ORDER BY
            extension asc,
              model_name ASC;
    SQL

    #プレースホルダ
    sql = ActiveRecord::Base.send(
      :sanitize_sql_array,
      [query,id: id]
    )

    return ActiveRecord::Base.connection.select_all(sql)
  end

  # コンテンツツリー用データ取得
  def self.get_three_info(id)
    query = <<-SQL
        SELECT
                distribution
            FROM
                videos
                    JOIN emms
                        ON (videos.id = emms.video_id)
                    JOIN mmd_objects
                        ON (emms.id = mmd_objects.emm_id)
                    JOIN wanteds
                        ON (
                            wanteds.file_name = mmd_objects.file_name
                            AND wanteds.folder_name = mmd_objects.folder_name
                            AND wanteds.extension = mmd_objects.extension
                        )
                    JOIN credits
                        ON (wanteds.id = credits.wanted_id)
                    JOIN authors_credits
                        ON (credits.id = authors_credits.credit_id)
                    JOIN authors
                        ON (authors.id = authors_credits.author_id)
            WHERE
                videos.id = :id
                AND is_show = true
                AND distribution <> ''
            GROUP BY
                distribution;
    SQL

    #プレースホルダ
    sql = ActiveRecord::Base.send(
      :sanitize_sql_array,
      [query,id: id]
    )

    return ActiveRecord::Base.connection.select_all(sql)
  end

end
