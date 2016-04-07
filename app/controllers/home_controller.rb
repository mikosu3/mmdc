class HomeController < ApplicationController
  def index
    @side_infos = Info.order(id: :desc).first(5)
    @ranks = RankingService.getRanks(3)

    respond_to do |format|
      format.html
      format.atom
      format.rss
    end
  end
end
