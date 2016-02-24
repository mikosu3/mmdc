class AddDispNameToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :disp_name, :string
  end
end
