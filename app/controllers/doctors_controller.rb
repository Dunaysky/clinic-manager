class DoctorsController < ApplicationController
  def index
    current_doctor
  end

  def show; end

  def current_doctor
    @current_doctor ||= current_profile.related_to
  end
end
