FactoryBot.define do
  factory :video do
    user
    sequence(:name) { |n| "動画#{n}号"}
  end
end

# == Schema Information
#
# Table name: videos
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  lock_version :integer
#  is_show      :boolean          default(TRUE)
#
# Indexes
#
#  index_videos_on_is_show_and_id  (is_show,id)
#  index_videos_on_user_id         (user_id)
#
