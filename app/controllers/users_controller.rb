class UsersController < ApplicationController
  def dashboard
    # if current_user.manager
      @sites = Site.where(user: current_user)
      @projects = Project.where(user: current_user)
    # else
      @applications = Placement.where(user: current_user)
      @placements = Placement.joins(:project)
                             .where("placements.user_id = ? AND placements.confirmed = ?", current_user.id, true)
                             .order("projects.start_date")
      @past_placements = Placement.joins(:project)
                                  .where("placements.user_id = ? AND projects.end_date < ?", current_user.id, DateTime.now)
                                  .order("projects.end_date")
      @qualifications = UserQualification.where(user: current_user)
    # end
  end
end
