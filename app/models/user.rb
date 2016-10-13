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
