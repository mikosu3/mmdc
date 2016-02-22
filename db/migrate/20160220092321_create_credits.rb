class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.string :distribution
      t.integer :lock_version
      t.references :wanted, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
