class UserQualificationsController < ApplicationController
  def create
    user_qualification = UserQualification.new(user_qualification_params)
    user_qualification.user = current_user
    if user_qualification.save!
      redirect_to user_dashboard_path(current_user)
    else
      redirect_to user_dashboard_path(current_user)
    end
  end

  def destroy
    user_qualification = UserQualification.find(params[:id])
    user_qualification.destroy
    redirect_to user_dashboard_path(current_user)
  end

  private

  def user_qualification_params
    params.require(:user_qualification).permit(:qualification_id)
  end
end
