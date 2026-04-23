class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  
  before_action :require_login, unless: :login_controller?
  
  helper_method :current_user, :logged_in?
  
  private
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    current_user.present?
  end
  
  def require_login
    unless logged_in?
      redirect_to login_path, alert: "Please login to continue"
    end
  end
  
  def login_controller?
    controller_name == 'sessions'
  end
end
