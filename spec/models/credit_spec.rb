require 'rails_helper'

RSpec.describe Credit, type: :model do

  before do
    @credit = build(:credit, author_names: ["a"])
  end

  describe 'バリデーション' do
    it 'nameが入っていればOK' do
      expect(@credit.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      @credit.name = ''
      expect(@credit.valid?).to eq(false)
    end

    it 'nameが100文字まではOK' do
      @credit.name = "a" * 100
      expect(@credit.valid?).to eq(true)
    end

    it 'nameが100文字越えたらNG' do
      @credit.name = "a" * 100 + "a"
      expect(@credit.valid?).to eq(false)
    end

    it 'distributionのフォーマット sm' do
      @credit.distribution = "sm9"
      expect(@credit.valid?).to eq(true)
    end

    it 'distributionのフォーマット im' do
      @credit.distribution = "im9"
      expect(@credit.valid?).to eq(true)
    end

    it 'distributionのフォーマット td' do
      @credit.distribution = "td9"
      expect(@credit.valid?).to eq(true)
    end

    it 'distributionのフォーマット nm' do
      @credit.distribution = "nm9"
      expect(@credit.valid?).to eq(true)
    end

    it 'distributionのフォーマット違ったらNG' do
      @credit.distribution = "a"
      expect(@credit.valid?).to eq(false)
    end

    it 'urlがフォーマット違ったらNG' do
      @credit.url = "a"
      expect(@credit.valid?).to eq(false)
    end

    it 'urlが250文字まではOK' do
      @credit.url = "http://" + "a"* 240 + ".jp"
      expect(@credit.valid?).to eq(true)
    end

    it 'urlが250文字越えたらNG' do
      @credit.url = "http://" + "a"* 241 + ".jp"
      expect(@credit.valid?).to eq(false)
    end

    it 'descriptionが255文字まではOK' do
      @credit.description = "a" * 255
      expect(@credit.valid?).to eq(true)
    end

    it 'descriptionが255文字越えたらNG' do
      @credit.description = "a" * 255 + "a"
      expect(@credit.valid?).to eq(false)
    end
  end
end

# == Schema Information
#
# Table name: credits
#
#  id           :integer          not null, primary key
#  distribution :string(255)      not null
#  lock_version :integer
#  wanted_id    :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string(255)      not null
#  url          :string(255)
#  updated_by   :integer          not null
#  description  :string(255)      default("")
#
# Indexes
#
#  index_credits_on_wanted_id  (wanted_id) UNIQUE
#
