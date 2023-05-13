class HomeController < ApplicationController
  before_action :authenticate_user!, only: %i[dashboard]

  def index; end

  def dashboard
    @userable_type = current_user.userable_type
    @appointments = @userable_type == 'Doctor' ? Appointment.where(doctor_id: current_user.userable.id) : Appointment.all

    registrations = @appointments.group_by_day(:created_at).count
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'User Registrations by Day')
      f.xAxis(categories: registrations.keys.map { |d| d.strftime('%Y-%m-%d') })
      f.series(name: 'User Registrations', data: registrations.values)
    end
  end
end
