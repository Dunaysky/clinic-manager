# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_profile!

  def index; end
end
