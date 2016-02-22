class CreateMmdObjects < ActiveRecord::Migration
  def change
    create_table :mmd_objects do |t|
      t.string :extension
      t.string :file_name
      t.string :folder_name
      t.string :full_path
      t.integer :lock_version
      t.references :emm, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
