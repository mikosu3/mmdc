class AddNotNullColumns < ActiveRecord::Migration
  def change
    change_column_null :credits, :updated_by, false
    change_column_null :authors, :updated_by, false
  end
end
