class AddDescriptionToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :description, :string, default: ''
  end
end
