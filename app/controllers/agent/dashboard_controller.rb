class Agent::DashboardController < ApplicationController
  def index
    unless current_user&.agent?
      redirect_to admin_dashboard_path, alert: "Access denied"
      return
    end
    
    @fields = current_user.fields
  end
end
