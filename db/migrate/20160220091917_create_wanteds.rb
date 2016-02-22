class CreateWanteds < ActiveRecord::Migration
  def change
    create_table :wanteds do |t|
      t.string :file_name
      t.string :folder_name
      t.string :extension
      t.integer :lock_version

      t.timestamps null: false
    end
  end
end
