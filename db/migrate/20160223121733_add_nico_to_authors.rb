class AddNicoToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :nico, :string
  end
end
