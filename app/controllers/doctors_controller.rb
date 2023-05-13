class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_doctor!

  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to edit_profile_path, notice: 'Personal Details Saved.' }
      else
        format.html { redirect_to edit_profile_path, alert: @doctor.errors.full_messages }
      end
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:description, :speciality, :experience, :phone_no)
  end
end
