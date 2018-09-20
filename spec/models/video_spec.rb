require 'rails_helper'

RSpec.describe Video, :type => :model do

  before do
    @video = build(:video)
  end

  describe 'バリデーション' do
    it 'nameが入っていればOK' do
      expect(@video.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      @video.name = ''
      expect(@video.valid?).to eq(false)
    end

    it 'nameが100文字まではOK' do
      @video.name = "a" * 100
      expect(@video.valid?).to eq(true)
    end

    it 'nameが100文字越えたらNG' do
      @video.name = "a" * 100 + "a"
      expect(@video.valid?).to eq(false)
    end
  end
end
