class HomeController < ApplicationController
  def index
    @side_infos = Info.order(id: :desc).first(5)
  end
end
