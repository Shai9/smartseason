class SessionsController < ApplicationController
  skip_before_action :require_login
  
  def new
    if logged_in?
      if current_user.admin?
        redirect_to admin_dashboard_path
      else
        redirect_to agent_dashboard_path
      end
    end
  end
  
  def create
    user = User.find_by(email: params[:email])
    
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      
      if user.admin?
        redirect_to admin_dashboard_path, notice: "Welcome back, #{user.name}!"
      else
        redirect_to agent_dashboard_path, notice: "Welcome back, #{user.name}!"
      end
    else
      flash.now[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out successfully"
  end
end
