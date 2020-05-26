class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all
    @placement = Placement.new

    @query = params[:query]

    query_geocoder_results = Geocoder.search(@query)
    query_coords = query_geocoder_results.first&.coordinates

    sites = Site.geocoded.near(@query, 50)
    sites.map do |site|
      @projects = site.projects
      @results = true
    end


    if @projects.empty? || !query_coords
      @results = false
      sites = Site.geocoded
      sites.map do |site|
        @projects = site.projects
      end
    end

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

end
