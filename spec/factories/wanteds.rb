FactoryBot.define do
  factory :wanted do
    sequence(:file_name) { |n| "ファイル#{n}号"}
    sequence(:folder_name) { |n| "フォルダ#{n}号"}
    extension "x"
  end
end

# == Schema Information
#
# Table name: wanteds
#
#  id           :integer          not null, primary key
#  file_name    :string(200)      not null
#  folder_name  :string(200)      not null
#  extension    :string(10)       not null
#  lock_version :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_wanteds_on_file_name_and_folder_name_and_extension  (file_name,folder_name,extension) UNIQUE
#
