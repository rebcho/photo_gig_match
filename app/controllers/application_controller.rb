class ApplicationController < ActionController::Base
  before_action :authenticate_photographer!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:name, :portfolio, :location_id, :expertise_level, :charge_rate])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:name, :portfolio, :location_id, :expertise_level, :charge_rate])
  end
end
