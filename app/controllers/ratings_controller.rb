class RatingsController < ApplicationController
before_action :authenticate_user!
  def create
    @rating = Rating.new(rating_params)
    @rating.save
    redirect_to user_manager_history_path(current_user)
  end

  private

  def rating_params
    params.require(:rating).permit(:worker_id, :manager_id, :placement_id, :stars)
  end
end
