#
# 貢献度ランキング
#
class RankingService

  #
  # ランキングを取得する
  #
  def self.getRanks(limit)

      ret = []
      rank = 1
      bf_rank = 1
      bf_point = 0
      i = 1

      # クレジット情報の更新履歴から統計
      credit_logs = CreditLog.limit(limit).group('user_id').order('count_user_id desc').count('user_id')

      credit_logs.each do | row |

        # 同ポイントは同ランクとする
        if bf_point == row[1]
          rank = bf_rank
        end

        ret << {"point"=> row[1], "user" => User.find(row[0]), "rank" => rank}

        bf_point = row[1]
        bf_rank = rank

        i += 1
        rank = i
      end

      return ret
  end
end