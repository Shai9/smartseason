class UpdatesController < ApplicationController
  before_action :require_login
  
  def new
    @field = Field.find(params[:field_id])
    @update = @field.updates.build
  end
  
  def create
    @field = Field.find(params[:field_id])
    @update = @field.updates.build(update_params)
    
    if @update.save
      redirect_to agent_dashboard_path, notice: "Field updated successfully"
    else
      render :new
    end
  end
  
  private
  
  def update_params
    params.require(:update).permit(:stage, :notes)
  end
  
  def require_login
    unless logged_in?
      redirect_to login_path, alert: "Please login first"
    end
  end
end
