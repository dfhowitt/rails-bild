class PlacementsController < ApplicationController
  before_action :set_placement, only: [:destroy]
  skip_before_action :verify_authenticity_token, :only => [:update]
  def create
    @placement = Placement.new
    @placement.user = current_user
    @placement.project = Project.find(params[:project_id])
    @placement.confirmed = true if @placement.project.autoconfirm == true
    if @placement.save
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @placement = Placement.find(params[:id])
    if @placement.update(confirmed: true)
      redirect_to user_dashboard_path(current_user, anchor: "site#{@placement.project.site.id}&project#{@placement.project.id}")
    else
      flash.now[:alert] = "Not saved."
    end
  end

  def destroy
    @placement.destroy
    redirect_to user_dashboard_path(current_user)
  end

  private

  def placement_params
    params.require(:placement).permit(:confirmed, :user_id, :project_id)
  end

  def set_placement
    @placement = Placement.find(params[:id])
  end
end
