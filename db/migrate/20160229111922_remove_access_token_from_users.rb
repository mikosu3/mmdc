class RemoveAccessTokenFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :access_token, :string
    remove_column :users, :access_token_secret, :string
  end
end
