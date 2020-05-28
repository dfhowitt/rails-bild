class PlacementsController < ApplicationController
  def create
    @placement = Placement.new
    @placement.user = current_user
    @placement.project = Project.find(params[:project_id])
    @placement.confirmed = true if @placement.project.autoconfirm == true
    @placement.save
  end

  def update
    @placement = Placement.find(params[:id])
    if @placement.update(confirmed: true)
      redirect_to user_dashboard_path(current_user, anchor: "site#{@placement.project.site.id}&project#{@placement.project.id}")
    else
      redirect_to user_dashboard_path(current_user, anchor: "site#{@placement.project.site.id}&project#{@placement.project.id}")
    end
  end
end
