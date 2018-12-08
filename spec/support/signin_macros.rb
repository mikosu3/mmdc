module SigninMacros
  def sign_in(user)
    cookies.signed[:auto_login_token] = user.auto_login_token
    cookies.signed[:uid] = user.uid
    session["user_id"] = user.id
  end
end
