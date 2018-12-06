FactoryBot.define do
  factory :credit do
    sequence(:name) { |n| "クレジット#{n}号"}
    wanted
    user
    distribution "sm9"
  end
end

# == Schema Information
#
# Table name: credits
#
#  id           :integer          not null, primary key
#  distribution :string(255)      not null
#  lock_version :integer
#  wanted_id    :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string(255)      not null
#  url          :string(255)
#  updated_by   :integer          not null
#  description  :string(255)      default("")
#
# Indexes
#
#  index_credits_on_wanted_id  (wanted_id) UNIQUE
#
