class AddItemToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :item, :string
    add_column :histories, :modify_type, :string
    remove_column :histories, :message
  end
end
