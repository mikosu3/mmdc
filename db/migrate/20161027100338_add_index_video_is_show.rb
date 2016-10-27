class AddIndexVideoIsShow < ActiveRecord::Migration
  def change
    add_index "videos", ["is_show", "id"], name: "index_videos_on_is_show_and_id", using: :btree
  end
end
