class CreateEmms < ActiveRecord::Migration
  def change
    create_table :emms do |t|
      t.string :original_name
      t.string :save_file_name
      t.integer :lock_version

      t.timestamps null: false
    end
  end
end
