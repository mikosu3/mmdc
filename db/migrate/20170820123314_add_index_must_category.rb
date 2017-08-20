class AddIndexMustCategory < ActiveRecord::Migration
  def change
    add_index :musts, :category
  end
end
