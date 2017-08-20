class AddCategoryToMust < ActiveRecord::Migration
  def change
    add_column :musts, :category, :string
  end
end
