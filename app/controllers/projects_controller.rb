class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    projects = Project.all

    # allows for one click apply
    @placement = Placement.new

    # check search field
    @query = params[:query]

    # geocode search and check database for project results
    query_geocoder_results = Geocoder.search(@query)
    query_coords = query_geocoder_results.first&.coordinates

    # return projects(geocoded) that fit search
    sites = Site.geocoded.near(@query, 50)
    sites.map do |site|
      projects = site.projects
      @results = true
    end

    # return all projects(geocoded) if nothing matches the search

    # select projects which still have capacity and haven't been applied to
    @projects = []
    projects.each do |project|
      unless current_user.projects.include?(project)
        @projects << project if find_remaining_capacity(project) > 0
      end
    end

    if @projects.empty? || !query_coords
      @results = false
      sites = Site.geocoded
      sites.map do |site|
        projects = site.projects
      end
    end
    # mark the map
    @markers = @projects.map do |project|
      {
        lat: project.site.latitude,
        lng: project.site.longitude
      }
    end
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
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project)
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
    params.require(:project).permit(:start_date, :end_date, :capacity, :wage, :description, :job_type)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def find_remaining_capacity(project)
    confirmed = 0
    project.placements.each do |placement|
      confirmed += 1 if placement.confirmed = true
    end
    project.capacity - confirmed
  end

end
