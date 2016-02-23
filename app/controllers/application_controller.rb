class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #ログインしているユーザーID
  def get_user_id
    return 3
  end

  #ログインしているユーザーのツイッター名
  def get_screen_name
    return "mikosu3"
  end
end
