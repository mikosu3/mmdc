class SessionsController < ApplicationController

  def callback
    auth = request.env['omniauth.auth']
    user = User.find_by(provider: auth["provider"], uid: auth["uid"])

    if user.nil?
      user = User.create_with_omniauth(auth)
    else
      #ユーザー情報更新
      user.screen_name = auth['info']['nickname']
      user.name = auth['info']['name']
      user.save
    end

    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
