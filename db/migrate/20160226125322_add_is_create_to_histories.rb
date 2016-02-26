class AddIsCreateToHistories < ActiveRecord::Migration
  def change
    remove_column :histories, :modify_type, :string
    add_column :histories, :is_create, :boolean, null: false, default: true
  end
end
