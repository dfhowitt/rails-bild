class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success
  helper_method :check_project_for_application_overlap, :check_user_application_dates, :check_project_qualification_requirements, :check_user_qualifications

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :manager])
  end


  # returns all PENDING applications project dates
  def check_user_application_dates(user)
    application_dates = []
    unconfirmed_placements = user.placements.where(:confirmed => nil)
    if unconfirmed_placements.empty?
      return application_dates
    else
      unconfirmed_placements.each do |placement|
        application_dates << (placement.project.start_date..placement.project.end_date)
      end
      return application_dates
    end
  end

  # Returns true if project overlaps with a pending application
  def check_project_for_application_overlap(project)
    project_dates = (project.start_date..project.end_date)
    conflict = false
    application_dates = check_user_application_dates(current_user)
    if application_dates.empty?
      return conflict
    else
      application_dates.each do |appdates|
        appdates.to_a
        project_dates.to_a
        if project_dates.first <= appdates.last && appdates.first <= project_dates.last
          conflict = true
        end
      end
      return conflict
    end
  end

  # returns all user qualifications
  def check_user_qualifications(user)
    quals = []
    user.qualifications.each do |qualification|
      quals << qualification.id
    end
    return quals
  end

  # returns true if user qualifies for project
  def check_project_qualification_requirements(project)
    # check each project qualification to see if it is included in the user qulifications
    qualifies = true
    user_quals = check_user_qualifications(current_user)
    project.qualifications.each do |qualification|
      unless user_quals.include?(qualification.id)
        qualifies = false
      end
    end
    return qualifies
  end

end
