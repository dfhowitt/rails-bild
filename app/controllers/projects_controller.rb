class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    projects = Project.all


    @unconfirmed_placement_dates = check_user_application_dates(current_user)
    @confirmed_placement_dates = check_user_placement_dates(current_user)


    # check search field
    @query = params[:query]

    # geocode search and check database for project results
    @query_geocoder_results = Geocoder.search(@query)
    @query_coords = @query_geocoder_results.first&.coordinates

    # return sites(geocoded) that fit search
    # sites = Site.geocoded.near(@query, 10)

    # # filter through the sites and push all projects with capacity that the user didn't apply into @projects
    # @projects = []

    # for filtering on index page
    if params[:distance].present?
      @projects = []
      nearby_sites = Site.geocoded.near(@query, params[:distance].to_i)
      filter_projects_from_site(nearby_sites)
      @results = true
    else
      @projects = []
      sites = Site.geocoded.near(@query, 10)
      filter_projects_from_site(sites)
      @results = true
    end

    if params[:site_type].present?
      @projects = @projects.select do |project|
        project.site.site_type == params[:site_type]
      end
    end

    if params[:autoconfirm].present?
      @projects = @projects.select{|project| project.autoconfirm == true}
    end

    if params[:start_date].present?
      @projects = @projects.select{|project| project.start_date > Date.parse(params[:start_date])}
    end

    if params[:wage].present?
      @projects = @projects.select{|project|project.wage > params[:wage].to_i}
    end

    if params[:sort_by].present?
      if params[:sort_by] == 'wage'
        @projects = @projects.sort_by(&params[:sort_by].to_sym).reverse
      elsif params[:sort_by] == 'start_date'
        @projects = @projects.sort_by(&params[:sort_by].to_sym)
      end
    end

    # return all available projects(geocoded) if nothing matches the search
    if @projects.empty? || !@query_coords
      sites = Site.geocoded
      filter_projects_from_site(sites)
      @results = false
    end

    # mark the map
    @markers = @projects.map do |project|
      {
        lat: project.site.latitude,
        lng: project.site.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { project: project, placement: Placement.new })
      }
    end

    # allows for one click apply
    @placement = Placement.new
  end

  def map_index
    index
  end

  def combined_index
    index
  end


  def show
    @placement = Placement.new
  end

  def new
    @project = Project.new
    @site = Site.find(params[:site_id])
  end

  def create
    @site = Site.find(params[:site_id])
    @project = Project.new(project_params)
    @project.site = @site
    if @project.save
      redirect_to user_dashboard_path(current_user)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @project.update(project_params)
      redirect_to user_dashboard_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to user_dashboard_path(current_user)
  end


  private

  def project_params
    params.require(:project).permit(:start_date, :end_date, :capacity, :wage, :description, :job_type, :autoconfirm, qualification_ids: [])
  end

  def set_project
    @project = Project.find(params[:id])
  end

  # removes anything with no remaining capacity
  def find_remaining_capacity(project)
    confirmed = 0
    project.placements.each do |placement|
      confirmed += 1 if placement.confirmed = true
    end
    project.capacity - confirmed
  end

  # returns all ACCEPTED applications project dates
  def check_user_placement_dates(user)
    placement_dates = []
    confirmed_placements = user.placements.where(:confirmed => true)
    if confirmed_placements.empty?
      return placement_dates
    else
      confirmed_placements.each do |placement|
        placement_dates << (placement.project.start_date..placement.project.end_date)
      end
      return placement_dates
    end
  end

  # checks if project overlaps with confirmed application
  def project_overlaps(project)
    confirmed_placement_dates = check_user_placement_dates(current_user)
    project_dates = (project.start_date..project.end_date)
    conflict = false
    confirmed_placement_dates.each do |dates|
      dates.to_a
      project_dates.to_a
      if project_dates.first <= dates.last && dates.first <= project_dates.last
        conflict = true
      end
    end
    return conflict
  end

  # removes anythign that was already applied to or that overlaps with current placement
  def filter_projects_from_site(sites)
    sites.each do |site|
        site.projects.each do |project|
          unless current_user.projects.include?(project) || project_overlaps(project)
            @projects << project if find_remaining_capacity(project) > 0
          end
        end
      end
    return @projects
  end
end


