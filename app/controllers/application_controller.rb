# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_profile!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_user
    @current_user ||= current_profile.related_to
  end

  def current_doctor
    @current_doctor ||= current_profile.related_to
  end

  def current_category
    @current_category ||= Category.first
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[first_name last_name phone_number password related_to_type related_to_id]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[phone_number password])
  end
end
