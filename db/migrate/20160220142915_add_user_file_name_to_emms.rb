class AddUserFileNameToEmms < ActiveRecord::Migration
  def change
    add_column :emms, :user_file_name, :string, null:false
  end
end
