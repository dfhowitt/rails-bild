class SitesController < ApplicationController
  def show

  end

  def new
    @site = Site.new

  end

  def create
    @site = Site.new(site_params)
    @site.user = current_user
    if @site.save
      redirect_to site_path(@site)
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def site_params
    params.require(:site).permit(:name, :location, :site_type)
  end
end
