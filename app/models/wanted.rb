class Wanted < ActiveRecord::Base
  has_one :credit

  # 検索許可するパラメータ
  def self.ransackable_attributes auth_object = nil
    %w(file_name folder_name extension)
  end
end
