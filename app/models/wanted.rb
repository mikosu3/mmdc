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
