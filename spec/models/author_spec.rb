require 'rails_helper'

RSpec.describe Author, type: :model do
  before do
    @author = build(:author)
  end

  describe 'バリデーション' do
    it 'nameが入っていればOK' do
      expect(@author.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      @author.name = ''
      expect(@author.valid?).to eq(false)
    end

    it 'nameが100文字まではOK' do
      @author.name = "a" * 100
      expect(@author.valid?).to eq(true)
    end

    it 'nameが100文字越えたらNG' do
      @author.name = "a" * 100 + "a"
      expect(@author.valid?).to eq(false)
    end

    it 'disp_nameが200文字まではOK' do
      @author.disp_name = "a" * 200
      expect(@author.valid?).to eq(true)
    end

    it 'disp_nameが200文字越えたらNG' do
      @author.disp_name = "a" * 200 + "a"
      expect(@author.valid?).to eq(false)
    end

    it 'nicoが文字だとNG' do
      @author.nico = 'aaa'
      expect(@author.valid?).to eq(false)
    end

    it 'nicoが20文字まではOK' do
      @author.nico = "1" * 20
      expect(@author.valid?).to eq(true)
    end

    it 'nicoが20文字越えたらNG' do
      @author.nico = "1" * 20 + "1"
      expect(@author.valid?).to eq(false)
    end

    it 'pixivが文字だとNG' do
      @author.pixiv = 'aaa'
      expect(@author.valid?).to eq(false)
    end

    it 'pixivが20文字まではOK' do
      @author.pixiv = "1" * 20
      expect(@author.valid?).to eq(true)
    end

    it 'pixivが20文字越えたらNG' do
      @author.pixiv = "1" * 20 + "1"
      expect(@author.valid?).to eq(false)
    end

    it 'urlがフォーマット違ったらNG' do
      @author.url = "a"
      expect(@author.valid?).to eq(false)
    end

    it 'urlが250文字まではOK' do
      @author.url = "http://" + "a"* 240 + ".jp"
      expect(@author.valid?).to eq(true)
    end

    it 'urlが250文字越えたらNG' do
      @author.url = "http://" + "a"* 241 + ".jp"
      expect(@author.valid?).to eq(false)
    end

    it 'twitterが30文字まではOK' do
      @author.twitter = "a" * 30
      expect(@author.valid?).to eq(true)
    end

    it 'twitterが30文字越えたらNG' do
      @author.twitter = "a" * 30 + "a"
      expect(@author.valid?).to eq(false)
    end

    describe 'フィルター処理' do
      it 'save後、historyの登録は行われている事' do
        expect {
          @author.save
        }.to change(History, :count).by(1)
      end
    end

  end
end
