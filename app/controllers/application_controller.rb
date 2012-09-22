class ApplicationController < ActionController::Base
  protect_from_forgery

  require 'active_admin_views_pages_base.rb'

  before_filter :reconnect_db
  after_filter  :restore_db
  helper_method :current_user

  rescue_from ActiveRecord::ConnectionAdapters::OracleEnhancedConnectionException, :with => :user_not_authorized

  def authenticate_app_user!
    redirect_to log_in_path if current_user.nil?
  end

  def current_app_user
    current_user
  end

  def reconnect_db
    logger.debug "[reconnect_db] Start..."

    #TODO: Change the default user to min-privilege crm_auth

    db_username = current_user.nil? ?
        "crm" :
        current_user.db_username

    db_password = current_user.nil? ?
        "Smartw4y" :
        Session.get_db_password(cookies[:db_session_id], cookies[:db_session_key])

    logger.debug "[reconnect_db] Establishing connection as: #{db_username}"

    ActiveRecord::Base.establish_connection(
        :adapter  => "oracle_enhanced",
        :username => db_username,
        :password => db_password,
        :database => "ORCL"
    )
  end

  def restore_db
    logger.debug "[restore_db] Restoring database connection"
    ActiveRecord::Base.establish_connection(
        :adapter  => "oracle_enhanced",
        :username => "crm",
        :password => "Smartw4y",
        :database => "ORCL"
    )
  end

  private

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  def user_not_authorized
    flash[:error] = "You do not have the necessary privileges."
    redirect_to :back
  end
end
