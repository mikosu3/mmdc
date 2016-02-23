class ChangeDatatypeUpdateByOfAuthors < ActiveRecord::Migration
  def change
    change_column :authors, :update_by, :string
  end
end
