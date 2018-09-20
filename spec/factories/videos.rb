FactoryBot.define do
  factory :video do
    user
    sequence(:name) { |n| "動画#{n}号"}
  end
end
