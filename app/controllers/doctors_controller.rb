# frozen_string_literal: true

class DoctorsController < ApplicationController
  def index
    current_user
    doctors
  end

  def show; end

  private

  def doctors
    @doctors ||= if params[:category] && params[:category] != ''
                   Doctor.where(category_id: params[:category])
                 else
                   Doctor.all
                 end
  end
end
