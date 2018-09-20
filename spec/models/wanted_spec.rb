require 'rails_helper'

RSpec.describe Wanted, :type => :model do

  before do
    @wanted = build(:wanted)
  end

  describe 'フィルター処理' do
    it 'save後、historyの登録は行われている事' do
      expect {
        @wanted.save
      }.to change(History, :count).by(1)
    end
  end
end
