require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe 'クラスメソッド' do
    it 'omniauthでユーザー登録が行える事' do
      auth = {}
      info = {}
      info['nickname'] = "test"
      info['name'] = "test_man"

      auth['provider'] = "twitter"
      auth['uid'] = "121212121"
      auth['info'] = info

      expect {
        User.create_with_omniauth(auth)
      }.to change(User, :count).by(1)
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
