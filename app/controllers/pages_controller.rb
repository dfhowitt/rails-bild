class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projects = Project.all
    @sites = Site.all
  end

  def about_us

  end
end
