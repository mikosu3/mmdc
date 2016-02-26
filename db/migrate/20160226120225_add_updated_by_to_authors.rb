class AddUpdatedByToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :updated_by, :integer
  end
end
