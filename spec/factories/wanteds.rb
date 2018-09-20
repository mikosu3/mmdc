FactoryBot.define do
  factory :wanted do
    sequence(:file_name) { |n| "ファイル#{n}号"}
    sequence(:folder_name) { |n| "フォルダ#{n}号"}
    extension "x"
  end
end
