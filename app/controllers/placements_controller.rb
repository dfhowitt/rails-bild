class PlacementsController < ApplicationController
  def create
    @placement = Placement.new
    @placement.user = current_user
    @placement.project = Project.find(params[:project_id])
    @placement.save
  end
end
