class AddFkToCredits < ActiveRecord::Migration
  def change
    add_foreign_key :credits, :wanteds
  end
end
