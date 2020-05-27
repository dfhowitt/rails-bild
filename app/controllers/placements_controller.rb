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
    @placement.confirmed = true
    @placement.save
  end
end
