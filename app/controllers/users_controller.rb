class UsersController < ApplicationController
  def dashboard
    # if current_user.manager
      @new_site = Site.new
      @sites = Site.where(user: current_user)
      @projects = Project.where(user: current_user)
    # else
      @applications = Placement.joins(:project)
                               .where("placements.user_id = ? AND projects.start_date > ?", current_user.id, DateTime.now)
      @placements = Placement.joins(:project)
                             .where("placements.user_id = ? AND placements.confirmed = ? AND projects.end_date > ?", current_user.id, true, DateTime.now)
                             .order("projects.start_date")
      @past_placements = Placement.joins(:project)
                                  .where("placements.user_id = ? AND projects.end_date < ?", current_user.id, DateTime.now)
                                  .order("projects.end_date")
      @qualifications = UserQualification.where(user: current_user)
      @new_qualification = UserQualification.new
    # end
  end
end
