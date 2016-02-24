class AddIndexNameToAuthors < ActiveRecord::Migration
  def change
     remove_index :authors, :name
     add_index :authors, :name, :unique => true
  end
end
