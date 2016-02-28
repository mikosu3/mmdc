class AddNameToMusts < ActiveRecord::Migration
  def change
    add_column :musts, :name, :string
  end
end
