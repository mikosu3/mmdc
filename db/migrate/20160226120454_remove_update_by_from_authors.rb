class RemoveUpdateByFromAuthors < ActiveRecord::Migration
  def change
    remove_column :authors, :update_by, :string
  end
end
