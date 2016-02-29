class AddIsShowToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :is_show, :boolean,  :default => true
  end
end
