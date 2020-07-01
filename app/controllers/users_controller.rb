class UsersController < ApplicationController
  def dashboard
    # if current_user.manager
      @new_site = Site.new
      sites = Site.all
      managed_sites = Site.joins(:user)
                          .where("sites.user_id = ?", current_user.id)
      active_projects = Project.joins(:site)
                                .where("sites.user_id = ? AND projects.end_date >= ?", current_user.id, DateTime.now)

      past_projects = Project.joins(:site)
                              .where("sites.user_id = ? AND projects.end_date < ?", current_user.id, DateTime.now)
      @active_sites = []
      @past_sites = []
      managed_sites.each do |site|
        active_site = false
        site.projects.each do |project|
          if project.end_date > DateTime.now
            active_site = true
          end
        end
        if active_site == true
          @active_sites << site
        else
          @past_sites << site
        end
      end
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
  def show
    sign_out :user
    redirect_to root_path
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

  def timesheet
    dashboard
  end

  def manager_history
    dashboard
  end

  def business
    @business = Business.find_by(user_id: current_user.id)
    @new_business = Business.new
    @new_employee = Employment.new
  end

  def manager_business
    @manager_business = Business.find_by(user_id: current_user.id)
    @new_manager_business = Business.new
    @new_manager_employee = Employment.new
  end

  def profile
    @user = User.find(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :encrypted_password, :address, :avatar)
  end

end
