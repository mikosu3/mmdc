class AddUpdateByToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :update_by, :integer
  end
end
