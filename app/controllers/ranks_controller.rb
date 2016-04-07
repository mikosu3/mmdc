class RanksController < ApplicationController
  before_action :set_rank, only: [:show, :edit, :update, :destroy]

  # GET /ranks
  # GET /ranks.json
  def index
    # 貢献度ランキングを取得
    @ranks = RankingService.getRanks(50)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rank
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rank_params
      params.fetch(:rank, {})
    end
end
