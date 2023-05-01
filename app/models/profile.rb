# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :related_to, polymorphic: true
  validates :phone_number, uniqueness: true, presence: true
  validates :first_name, presence: true
  validate :verify_phone_number

  def verify_phone_number
    return if /^\+[0-9]+$/.match?(phone_number)

    errors.add(:base,
               'Phone number must consist exclusively of numbers and the + sign at the beginning')
  end
end
