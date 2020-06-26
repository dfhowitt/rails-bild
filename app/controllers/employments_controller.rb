class EmploymentsController < ApplicationController
  def create
    @business = Business.find(params[:business_id])
    @employment = Employment.new(employment_params)
    @employment.business = @business
    if @employment.save
      redirect_back(fallback_location: root_path)
    else
      flash.alert = "Employee did not go through, please try again."
    end
  end

  def update

  end

  def destroy

  end

  private

  def employment_params
    params.require(:employment).permit(:user_id, :business_id)
  end

end
