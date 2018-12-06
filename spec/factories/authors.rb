FactoryBot.define do
  factory :author do
    sequence(:name) { |n| "ビームマン#{n}号"}
    sequence(:disp_name) { |n| "ビーム#{n}"}
    updated_by 1
  end
end

# == Schema Information
#
# Table name: authors
#
#  id           :integer          not null, primary key
#  name         :string(100)      not null
#  url          :string(255)
#  twitter      :string(255)
#  pixiv        :string(255)
#  email        :string(255)
#  lock_version :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  nico         :string(255)
#  disp_name    :string(255)
#  updated_by   :integer          not null
#
# Indexes
#
#  index_authors_on_name  (name) UNIQUE
#
