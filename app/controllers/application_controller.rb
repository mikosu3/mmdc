class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :auth, :get_side_info

  protect_from_forgery

  def login_required

    user = User.find_by_uid_and_auto_login_token(cookies.signed[:uid], cookies.signed[:auto_login_token])

    if user
      @current_user = user

      if @current_user.is_ban
        redirect_to logout_path, alert: 'お使いのアカウントはブロックされています。'
      end
      
      # トークンを更新
      @current_user.save
      rehash_token @current_user
    else
      redirect_to root_path, notice: 'ログインしてください。'
    end

  end

  helper_method :current_user

  def rehash_token user
      cookies.signed[:auto_login_token] = {:value => user.auto_login_token, :expires => 14.day.from_now}
      cookies.signed[:uid] = {:value => user.uid, :expires => 14.day.from_now}
  end

  #ログインしているユーザーID
  def get_user_id
    current_user
    return @current_user.id
  end

  #ログインしているユーザーのツイッター名
  def get_screen_name
    return User.find(get_user_id).screen_name
  end

  # ログインユーザーが管理者か
  def check_admin
    unless current_user['is_admin'] then
      redirect_to root_path
    end
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
    @current_user ||= User.find_by_uid_and_auto_login_token(cookies.signed[:uid], cookies.signed[:auto_login_token]) if (cookies.signed[:uid] && cookies.signed[:auto_login_token])
  end

  # ログインチェック
  def auth
    if controller_name != "home" && controller_name != "sessions" && controller_name != "infos"
      login_required
    end
  end

end
