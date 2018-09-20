FactoryBot.define do
  factory :credit do
    sequence(:name) { |n| "クレジット#{n}号"}
  end
end
