class AddNotNull < ActiveRecord::Migration
  def change
     # [形式] change_column(テーブル名, カラム名, データタイプ, オプション)
    change_column :authors, :name, :string, null: false
    change_column :credits, :distribution, :string, null: false
    change_column :credits, :wanted_id, :integer, null: false
    change_column :emms, :original_name, :string, null: false
    change_column :emms, :save_file_name, :string, null: false
    change_column :infos, :title, :string, null: false
    change_column :mmd_objects, :extension, :string, null: false
    change_column :mmd_objects, :file_name, :string, null: false
    change_column :mmd_objects, :folder_name, :string, null: false
    change_column :mmd_objects, :full_path, :string, null: false
    change_column :mmd_objects, :emm_id, :integer, null: false
    change_column :users, :is_admin, :boolean, null: false, default:false
    change_column :users, :screen_name, :string, null: false
    change_column :users, :twitter_user_id, :integer, null: false
    change_column :users, :access_token, :string, null: false
    change_column :users, :access_token_secret, :string, null: false
    change_column :users, :ticket, :string, null: false
    change_column :wanteds, :file_name, :string, null: false
    change_column :wanteds, :folder_name, :string, null: false
    change_column :wanteds, :extension, :string, null: false
  end
end
