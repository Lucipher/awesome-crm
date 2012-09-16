
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])

    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end

      session_key = SecureRandom.hex(64)
      ses = Session.generate(user.db_password)
      cookies[:db_session_id]  = ses.cookie_id
      cookies[:db_session_key] = ses.session_key

      ses.save

      redirect_to root_url, :notice => "Logged in successfully."
    else
      flash.now.alert = "Invalid username or password."
      render "new"
    end
  end

  def destroy
    ses = Session.find_by_cookie_id(cookies[:db_session_id])
    ses.delete if ses

    cookies.delete(:auth_token)
    cookies.delete(:db_session_id)
    cookies.delete(:db_session_key)

    redirect_to root_url, :notice => "Logged out successfully."
  end
end
