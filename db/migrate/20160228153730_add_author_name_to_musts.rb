class AddAuthorNameToMusts < ActiveRecord::Migration
  def change
    add_column :musts, :author_name, :string
  end
end
