class User < ActiveRecord::Base
  has_many :video
  has_many :credit_log

  before_save do
    # オートログイン用トークンを生成
    self.auto_login_token = SecureRandom.hex
  end
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.screen_name = auth['info']['nickname']
      user.name = auth['info']['name']
    end
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
