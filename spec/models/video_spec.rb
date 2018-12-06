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
