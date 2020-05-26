class UsersController < ApplicationController
  def dashboard
    if current_user.manager
      @sites = Site.where(user: current_user)
      @projects = Project.where(user: current_user)
    else
      @applications = Placement.where(user: current_user)
      @placements = Placement.where("user_id = ? AND confirmed = ?", current_user.id, true).order(:start_date)
      @qualifications = UserQualification.where(user: current_user)
    end
  end
end
