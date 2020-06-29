class EmploymentsController < ApplicationController
  def create
    @business = Business.find(params[:business_id])
    @employment = Employment.new(employment_params)
    @employment.business = @business
    raise
    if @employment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
      flash.alert = "Employee did not go through, please try again."
    end
  end

  def search_create
    @worker = User.find_by(email: params[:employment][:user])
    @business = Business.find(params[:employment][:business_id])
    @employment = Employment.new
    @employment.business = @business
    @employment.user = @worker
    if @employment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
      flash.alert = "User not found, please try another email."
    end

  end

  def update

  end

  def destroy
    @employee = Employment.find(params[:id])
    @employee.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def employment_params
    params.require(:employment).permit(:user_id, :business_id)
  end

end
