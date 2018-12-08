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

# == Schema Information
#
# Table name: wanteds
#
#  id           :integer          not null, primary key
#  file_name    :string(200)      not null
#  folder_name  :string(200)      not null
#  extension    :string(10)       not null
#  lock_version :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_wanteds_on_file_name_and_folder_name_and_extension  (file_name,folder_name,extension) UNIQUE
#
