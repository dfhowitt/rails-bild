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
      @placement_dates = @placements.map do |placement|
        {
          title: placement.project.job_type,
          start: placement.project.start_date,
          end: placement.project.end_date
        }
      end
      @past_placements = Placement.joins(:project)
                                  .where("placements.user_id = ? AND projects.end_date < ?", current_user.id, DateTime.now)
                                  .order("projects.end_date")
      @qualifications = UserQualification.where(user: current_user)
      @new_qualification = UserQualification.new
    # end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_profile_path(current_user)
    else
      render :edit
    end
  end

  def application
    dashboard
  end

  def history
    dashboard
  end

  def qualification
    dashboard
  end

  def schedule
    dashboard
  end

  def profile
    @user = User.find(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :encrypted_password, :address, :avatar)
  end

end
