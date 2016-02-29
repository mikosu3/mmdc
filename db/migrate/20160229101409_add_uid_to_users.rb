class AddUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uis, :string
    remove_column :users, :twitter_user_id, :integer
  end
end
