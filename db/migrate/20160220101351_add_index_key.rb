class AddIndexKey < ActiveRecord::Migration

  def change

    # インデックスキーを貼るカラムの文字数制限
    change_column :authors, :name, :string, limit: 100
    change_column :mmd_objects, :file_name, :string, limit: 200
    change_column :mmd_objects, :folder_name, :string, limit: 200
    change_column :mmd_objects, :extension, :string, limit: 10
    change_column :wanteds, :file_name, :string, limit: 200
    change_column :wanteds, :folder_name, :string, limit: 200
    change_column :wanteds, :extension, :string, limit: 10

    add_index :authors, :name
    add_index :mmd_objects, [:file_name, :folder_name, :extension]
    add_index :wanteds, [:file_name, :folder_name, :extension], unique: true

  end
end
