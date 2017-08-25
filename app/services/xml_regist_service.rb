class XmlRegistService < EmmRegistService
  class << self
    
    def save_as_emm(file, video, index)
      save_emm(file, video, index)
    end
    
    # xmlファイルを解析し、登録する
    def analyze_emm(file, emm)
      xml = Hash.from_xml(File.read(file))
      hash2mmd_object(xml, emm)
    end

    def hash2mmd_object(raw, emm)
      h = raw["MMProject"]["Models"]
      targets = ["Model", "Accessory", "Effect"]

      # 欲しい要素のみ登録する
      targets.each do |target|
        next if h[target].nil?
        
        h[target].each do |row|
          next if !row.kind_of?(Hash) || !row.has_key?("File") 
          
          item = row["File"]

          if item.present?
            createMmdObject(emm, item.gsub("\\" , "/"))
          end          
        end
      end
    end

    def copy_file(file, savefile_name)
      FileUtils.cp(file.tempfile, get_save_file_path + savefile_name)
    end
  end
end