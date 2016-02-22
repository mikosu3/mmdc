class AddVideoIdToEmms < ActiveRecord::Migration
  def change
    add_column :emms, :video_id, :integer
  end
end
