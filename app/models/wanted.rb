class Wanted < ActiveRecord::Base
  has_one :credit
  after_save :add_history

  # 検索許可するパラメータ
  def self.ransackable_attributes auth_object = nil
    %w(file_name folder_name extension)
  end

  private

    # 履歴追加
    def add_history
      history = History.new

      history.link = '/credits/new/' + self.id.to_s
      history.item = 'Wanted'
      history.item_name = self.file_name
      history.is_create = true

      history.save
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
