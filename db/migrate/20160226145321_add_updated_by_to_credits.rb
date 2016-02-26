class AddUpdatedByToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :updated_by, :integer
  end
end
