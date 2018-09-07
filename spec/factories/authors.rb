FactoryBot.define do
  factory :author do
    sequence(:name) { |n| "ビームマン#{n}号"}
    sequence(:disp_name) { |n| "ビーム#{n}"}
  end
end
