class SessionsController < ApplicationController

  def callback
    auth = request.env['omniauth.auth']
    user = User.find_by(provider: auth["provider"], uid: auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
