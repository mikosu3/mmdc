class XmlRegistService < EmmRegistService
  class << self
    
    def save_as_emm(file, video, index)
      save_emm(file, video, index)
    end
    
    # xmlファイルを解析し、登録する
    def analyze_emm(file, emm)
      xml = Hash.from_xml(File.read(file))["MMProject"]["Models"]
      targets = ["Model", "Accessory", "Effect"]

      # 欲しい要素のみ登録する
      targets.each do |target|
        next if xml[target].nil?
        
        xml[target].each do |row|
          next if !row.kind_of?(Hash) || !row.has_key?("File") 
          
          item = row["File"]

          if item.present?
            createMmdObject(emm, item)
          end          
          
        end
      end
    end

    # ファイル内のパス区切り文字を変更し、コピーする
    def copy_file(file, savefile_name)
      s = File.read(file.tempfile, encoding: 'UTF-8:UTF-8')
      s.gsub!("\\" , "/");

      File.write(get_save_file_path + savefile_name, s)
    end
  end
end