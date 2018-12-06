class Emm < ActiveRecord::Base
  belongs_to :video
  has_many :mmd_object


  # emm詳細情報取得
  def self.get_emm_details(emm_id, user_id)
    query = <<-SQL
      SELECT
              mmd_objects.folder_name
              ,mmd_objects.file_name
              ,mmd_objects.extension
              ,wanteds.id as wanted_id
              ,credits.id AS credit_id
          FROM
              videos
                  JOIN emms
                      ON (videos.id = emms.video_id)
                  JOIN mmd_objects
                      ON (emms.id = mmd_objects.emm_id)
                  LEFT OUTER JOIN wanteds
                      ON (
                          wanteds.file_name = mmd_objects.file_name
                          AND wanteds.folder_name = mmd_objects.folder_name
                          AND wanteds.extension = mmd_objects.extension
                      )
                  LEFT OUTER JOIN credits
                      ON (wanteds.id = credits.wanted_id)
          WHERE
              emms.id = :emm_id
              AND videos.is_show = true
              AND videos.user_id = :user_id
    SQL

    #プレースホルダ
    sql = ActiveRecord::Base.send(
      :sanitize_sql_array,
      [query, emm_id: emm_id, user_id: user_id]
    )

    return ActiveRecord::Base.connection.select_all(sql)
  end
end

# == Schema Information
#
# Table name: emms
#
#  id             :integer          not null, primary key
#  original_name  :string(255)      not null
#  save_file_name :string(255)      not null
#  lock_version   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  video_id       :integer
#
