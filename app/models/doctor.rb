# frozen_string_literal: true

class Doctor < ApplicationRecord
  belongs_to :category
  has_many   :doctor_users, dependent: :nullify
  has_many   :users, through: :doctor_users
  has_one    :profile, as: :related_to, dependent: :destroy
  
  scope :without_profile, -> { select { |doctor| doctor.profile.nil? } }
  scope :with_profile, -> { select { |doctor| doctor.profile.present? } }

  def display_name
    "#{profile ? "#{profile.first_name} #{profile.last_name}" : "Id:#{id}"} | #{category.name}"
  end
end
