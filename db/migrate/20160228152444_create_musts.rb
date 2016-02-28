class CreateMusts < ActiveRecord::Migration
  def change
    create_table :musts do |t|
      t.string :video

      t.timestamps null: false
    end
  end
end
