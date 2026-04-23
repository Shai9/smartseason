class FieldsController < ApplicationController
  before_action :require_login
  
  def new
    @field = Field.new
    @agents = User.where(role: :agent)
  end
  
  def create
    @field = Field.new(field_params)
    
    if @field.save
      redirect_to admin_dashboard_path, notice: "Field created successfully"
    else
      @agents = User.where(role: :agent)
      render :new
    end
  end
  
  def edit
    @field = Field.find(params[:id])
    @agents = User.where(role: :agent)
  end
  
  def update
    @field = Field.find(params[:id])
    
    if @field.update(field_params)
      redirect_to admin_dashboard_path, notice: "Field updated successfully"
    else
      @agents = User.where(role: :agent)
      render :edit
    end
  end
  
  private
  
  def field_params
    params.require(:field).permit(:name, :crop_type, :planting_date, :agent_id)
  end
  
  def require_login
    unless logged_in?
      redirect_to login_path, alert: "Please login first"
    end
  end
end
