class Must < ActiveRecord::Base
  class << self
    def select_musts(video)
      categories = ["all"]
      
      # 動画によってmustを分ける
      video.emm.each do |emm|
        if File.extname(emm.original_name) == ".xml" || File.extname(emm.original_name) == ".mpj"
          categories << "mmm"
        else
          categories << "mmd"
        end
      end

      where(category: categories.uniq)
    end
  end
end
