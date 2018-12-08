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

# == Schema Information
#
# Table name: musts
#
#  id          :integer          not null, primary key
#  video       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string(255)
#  author_name :string(255)
#  category    :string(255)
#
# Indexes
#
#  index_musts_on_category  (category)
#
