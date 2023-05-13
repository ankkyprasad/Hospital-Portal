class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def user_doctor!
    return redirect_to root_path, alert: 'You need be a Doctor!!' unless current_user.userable_type == 'Doctor'

    @doctor = current_user.userable
  end

  def user_receptionist!
    return redirect_to root_path, alert: 'You need to be a Receptionist!!' unless current_user.userable_type == 'Receptionist'

    @receptionist = current_user.userable
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
