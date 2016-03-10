class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :auth, :get_side_info

  protect_from_forgery

  def login_required
    if session[:user_id]
      @current_user = User.find(session[:user_id])

      if @current_user.is_ban
        redirect_to logout_path, alert: 'お使いのアカウントはブロックされています。'
      end

    else
      redirect_to root_path, notice: 'ログインしてください。'
    end

  end

  helper_method :current_user

  #ログインしているユーザーID
  def get_user_id
    return session[:user_id]
  end

  #ログインしているユーザーのツイッター名
  def get_screen_name
    return User.find(get_user_id).screen_name
  end

  private
    #サイドメニュー情報取得
    def get_side_info
      @histories = History.order(id: :desc).first(30)

      @wanted_size = Wanted.includes(:credit).where(credits: {id: nil}).size
      @credit_size = Credit.all.size
      @author_size = Author.all.size

      @wanted_today_size = Wanted.includes(:credit).where(credits: {id: nil}, created_at: 0.day.ago.all_day).size
      @credit_today_size = Credit.where(created_at: 0.day.ago.all_day).size
      @author_today_size = Author.where(created_at: 0.day.ago.all_day).size

    end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  # ログインチェック
  def auth
    if controller_name != "home" && controller_name != "sessions"
      login_required
    end
  end

end
