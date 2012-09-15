
class SessionsController < ApplicationController
  @@db_session_passwords = Hash.new

  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      @@db_session_passwords[session[:session_id]] = user.db_password
      redirect_to root_url, :notice => "Logged in successfully."
    else
      flash.now.alert = "Invalid username or password."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    @@db_session_passwords[session[:session_id]] = nil
    redirect_to root_url, :notice => "Logged out successfully."
  end

  def self.password_for_session(session_id)
    logger.debug @@db_session_passwords
    @@db_session_passwords[session_id]
  end
end
