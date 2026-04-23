class Admin::DashboardController < ApplicationController
  def index
    unless current_user&.admin?
      redirect_to agent_dashboard_path, alert: "Access denied"
      return
    end
    
    @fields = Field.all
    @agents = User.where(role: :agent)
  end
end
