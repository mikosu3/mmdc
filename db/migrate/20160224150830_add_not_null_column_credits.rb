class AddNotNullColumnCredits < ActiveRecord::Migration
  def change
    change_column_null :credits, :author_id, false
    change_column_null :credits, :name, false
  end
end
