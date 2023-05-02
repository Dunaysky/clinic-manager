class UsersController < ApplicationController
  def index
    current_user
    current_category
  end

  def show; end

  def current_user
    @current_user ||= current_profile.related_to
  end

  def current_category
    @current_category ||= Category.first
  end
end
