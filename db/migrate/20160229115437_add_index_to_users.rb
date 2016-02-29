class AddIndexToUsers < ActiveRecord::Migration
  def change
    change_column_null :users, :provider, false
    change_column_null :users, :uid, false
    add_index :users, [:provider, :uid], unique: true
  end
end
