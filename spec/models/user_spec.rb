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
