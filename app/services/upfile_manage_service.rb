# emmとxmlの振り分けを行う
class UpfileManageService
  class << self
    
    def save(files, video)
      files.each_with_index do | file, index |
        if File.extname(file.original_filename) == ".xml"
          XmlRegistService.save_as_emm(file, video, index)
        elsif File.extname(file.original_filename) == ".mpj"
          MpjRegistService.save_as_emm(file, video, index)
        else
          EmmRegistService.save_emm(file, video, index)
        end
      end
    end
  end
end