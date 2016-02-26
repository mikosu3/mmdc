class AddItemNameToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :item_name, :string
  end
end
