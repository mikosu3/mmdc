class AddIndexWantedIdToCredits < ActiveRecord::Migration
  def change
     remove_foreign_key :credits, :wanteds
     remove_index :credits, :wanted_id
     add_index :credits, :wanted_id, :unique => true
  end
end
