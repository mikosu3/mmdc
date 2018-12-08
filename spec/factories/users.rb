FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:screen_name) { |n| "TEST_SCREEN_NAME#{n}"}
    sequence(:uid) { |n| "TEST_UID_#{n}"}
    sequence(:auto_login_token) { |n| "auto_login_token_#{n}"}
    provider "twitter"
  end
end

# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  is_admin         :boolean          default(FALSE), not null
#  screen_name      :string(255)      not null
#  lock_version     :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  uid              :string(255)      not null
#  provider         :string(255)      not null
#  name             :string(255)
#  is_ban           :boolean          default(FALSE), not null
#  auto_login_token :string(255)
#
# Indexes
#
#  index_users_on_provider_and_uid  (provider,uid) UNIQUE
#
