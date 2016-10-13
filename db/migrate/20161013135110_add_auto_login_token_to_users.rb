class AddAutoLoginTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :auto_login_token, :string
  end
end
