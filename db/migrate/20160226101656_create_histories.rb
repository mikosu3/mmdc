class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :link
      t.string :message

      t.timestamps null: false
    end
  end
end
