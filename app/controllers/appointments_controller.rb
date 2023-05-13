class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_receptionist!, only: %i[new create edit update destroy]
  before_action :doctors, only: %i[edit new]
  before_action :appointment, only: %i[show edit update]

  def new
    @appointment = Appointment.new
  end

  def show; end

  def create
    @appointment = Appointment.create(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to appointment_path(@appointment), notice: 'New Appointment Booked' }
      else
        format.html { redirect_to new_appointment_path, alert: @appointment.errors.full_messages }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      p appointment_params
      p '-' * 100
      if @appointment.update(appointment_params)
        format.html { redirect_to appointment_path(@appointment), notice: 'Appointment Edited' }
      else
        format.html { redirect_to edit_appointment_path(@appointment), alert: @appointment.errors.full_messages }
      end
    end
  end

  def destroy
    respond_to do |format|
      if Appointment.destroy(params[:id])
        format.html { redirect_to root_path, notice: 'Appointment Cancelled' }
      else
        format.html { redirect_to root_path, alert: 'Some Error has occured' }
      end
    end
  end

  private

  def doctors
    @doctors = User.includes(:userable).where(userable_type: 'Doctor').map do |doctor|
      ["Dr. #{doctor.name}", doctor.userable_id]
    end
  end

  def appointment
    @appointment = Appointment.find_by_id(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:first_name, :last_name, :street_address, :city, :state, :date_of_birth, :phone_no, :appointment_date, :appointment_time, :doctor_id)
  end
end
