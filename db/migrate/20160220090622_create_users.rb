class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :is_admin
      t.string :screen_name
      t.integer :twitter_user_id
      t.integer :lock_version
      t.string :access_token
      t.string :access_token_secret
      t.string :ticket

      t.timestamps null: false
    end
  end
end
