class AddLockVersionToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :lock_version, :integer
  end
end
