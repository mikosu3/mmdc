FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:screen_name) { |n| "TEST_SCREEN_NAME#{n}"}
    sequence(:uid) { |n| "TEST_UID_#{n}"}
    provider "twitter"
  end
end
