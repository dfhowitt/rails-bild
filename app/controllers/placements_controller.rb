class PlacementsController < ApplicationController
  def create
    @placement = Placement.new[placement_params]
    @placement.user = User.find(params[:user_id])
    @placement.save
  end

  private

  def placement_params
    params.require(:placement).permit(:project_id)
  end
end
