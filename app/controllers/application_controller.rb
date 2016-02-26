class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_side_info

  #ログインしているユーザーID
  def get_user_id
    return 3
  end

  #ログインしているユーザーのツイッター名
  def get_screen_name
    return "mikosu3"
  end

  private
    #更新情報取得
    def get_side_info
      @histories = History.order(id: :desc).first(30)
      @side_infos = Info.order(id: :desc).first(3)
    end

end
