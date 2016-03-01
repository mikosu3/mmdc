class Video < ActiveRecord::Base

  attr_accessor :total
  attr_accessor :resolveds
  attr_accessor :yets
  attr_accessor :wants

  validates :name, presence: true
  validates :name, length: { maximum: 100 }
  has_many :emm

  paginates_per 15

  # 1動画で使用したオブジェクト数
  def self.set_total(video)
    query = <<-SQL
      SELECT
              *
          FROM
              (
                  SELECT
                          COUNT(*) AS total
                      FROM
                          (
                              SELECT
                                      mmd_objects.file_name
                                      ,mmd_objects.folder_name
                                      ,mmd_objects.extension
                                  FROM
                                      videos
                                          JOIN emms
                                              ON (videos.id = emms.video_id)
                                          JOIN mmd_objects
                                              ON (emms.id = mmd_objects.emm_id)
                                  WHERE
                                      videos.id = :id
                                      AND is_show = true
                                  GROUP BY
                                      file_name
                                      ,folder_name
                                      ,extension
                          ) AS A
              ) AS total
              ,(
                  SELECT
                          COUNT(*) AS yets
                      FROM
                          (
                              (
                                  SELECT
                                          mmd_objects.file_name
                                          ,mmd_objects.folder_name
                                          ,mmd_objects.extension
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
                                      WHERE
                                          videos.id = :id
                                          AND is_show = true
                                          AND wanteds.id IS null
                                      GROUP BY
                                          file_name
                                          ,folder_name
                                          ,extension
                              ) AS B
                          )
              ) AS yet
              ,(
                  SELECT
                          COUNT(*) AS wants
                      FROM
                          (
                              SELECT
                                      mmd_objects.file_name
                                      ,mmd_objects.folder_name
                                      ,mmd_objects.extension
                                  FROM
                                      videos
                                          JOIN emms
                                              ON (videos.id = emms.video_id)
                                          JOIN mmd_objects
                                              ON (emms.id = mmd_objects.emm_id)
                                          JOIN wanteds
                                              ON (
                                                  wanteds.file_name = mmd_objects.file_name
                                                  AND wanteds.folder_name = mmd_objects.folder_name
                                                  AND wanteds.extension = mmd_objects.extension
                                              )
                                  WHERE
                                      videos.id = :id
                                      AND is_show = true
                                  GROUP BY
                                      file_name
                                      ,folder_name
                                      ,extension
                          ) AS C
              ) AS want
              ,(
                  SELECT
                          COUNT(*) AS resolveds
                      FROM
                          (
                              SELECT
                                      mmd_objects.file_name
                                      ,mmd_objects.folder_name
                                      ,mmd_objects.extension
                                  FROM
                                      videos
                                          JOIN emms
                                              ON (videos.id = emms.video_id)
                                          JOIN mmd_objects
                                              ON (emms.id = mmd_objects.emm_id)
                                          JOIN wanteds
                                              ON (
                                                  wanteds.file_name = mmd_objects.file_name
                                                  AND wanteds.folder_name = mmd_objects.folder_name
                                                  AND wanteds.extension = mmd_objects.extension
                                              )
                                          JOIN credits
                                              ON (wanteds.id = credits.wanted_id)
                                  WHERE
                                      videos.id = :id
                                      AND is_show = true
                                  GROUP BY
                                      file_name
                                      ,folder_name
                                      ,extension
                          ) AS D
              ) AS resolveds;
    SQL

    #プレースホルダ
    sql = ActiveRecord::Base.send(
      :sanitize_sql_array,
      [query,id: video.id]
    )

    cnt = ActiveRecord::Base.connection.select_one(sql)
    video.yets = cnt['yets']
    video.total = cnt['total']
    video.resolveds = cnt['resolveds']
    video.wants = cnt['wants']

  end

  # DL用モデルデータ取得
  def self.get_dl_video_info(id)
    query = <<-SQL
      SELECT
              COALESCE(credits.name, mmd_objects.file_name) AS model_name
              ,authors.disp_name
              ,credits.distribution
              ,mmd_objects.extension
              ,IF (
                  credits.name IS null
                  ,'×'
                  ,'○'
              ) AS status
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
                  LEFT OUTER JOIN authors_credits
                      ON (credits.id = authors_credits.credit_id)
                  LEFT OUTER JOIN authors
                      ON (authors.id = authors_credits.author_id)
          WHERE
              videos.id = :id
              AND is_show = true
          GROUP BY
              model_name
              ,disp_name
              ,distribution
          ORDER BY
            extension asc,
              model_name ASC;
    SQL

    #プレースホルダ
    sql = ActiveRecord::Base.send(
      :sanitize_sql_array,
      [query,id: id]
    )

    return ActiveRecord::Base.connection.select_one(sql)
  end
end
