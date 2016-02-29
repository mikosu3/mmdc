class ChangeUisToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :uis, :uid
  end
end
