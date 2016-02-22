class ChangeUserFileNameToEmms < ActiveRecord::Migration
  def change
    rename_column :emms, :user_file_name, :video_name
  end
end
