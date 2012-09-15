class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :reconnect_db
  helper_method :current_user

  def authenticate_app_user!
    redirect_to log_in_path if current_user.nil?
  end

  def current_app_user
    current_user
  end

  def reconnect_db
    logger.debug "[reconnect_db] Start..."

    #TODO: Change the default user to min-privilege crm_auth
    db_username = current_user.nil? ? "crm" : current_user.db_username
    db_password = current_user.nil? ? "Smartw4y" : SessionsController.password_for_session(session[:session_id])

    logger.debug "[reconnect_db] Establishing connection as: #{db_username} identified by #{db_password}"

    ActiveRecord::Base.establish_connection(
        :adapter => "oracle_enhanced",
        :username => db_username,
        :password => db_password,
        :database => "ORCL"
    )
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
