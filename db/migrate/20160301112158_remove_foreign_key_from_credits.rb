class RemoveForeignKeyFromCredits < ActiveRecord::Migration
  def change
    remove_foreign_key :credits, :authors
    remove_index :credits, :author_id
    remove_column :credits, :author_id, :integer
  end
end
