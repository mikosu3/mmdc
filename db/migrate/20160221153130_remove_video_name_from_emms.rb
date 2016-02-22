class RemoveVideoNameFromEmms < ActiveRecord::Migration
  def change
    remove_column :emms, :video_name, :string
  end
end
