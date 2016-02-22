class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.date :date
      t.string :title
      t.text :note
      t.integer :lock_version

      t.timestamps null: false
    end
  end
end
