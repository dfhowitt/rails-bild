class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :info, :error, :warning, :success
  helper_method :check_project_for_application_overlap, :check_user_application_dates



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

end
