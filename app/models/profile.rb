# frozen_string_literal: true

class Profile < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :related_to, polymorphic: true

  validates :phone_number, uniqueness: true, presence: true
  validates :first_name, presence: true
  validate :verify_phone_number

  def email_changed?
    false
  end

  alias will_save_change_to_email? email_changed?
  alias email_required? email_changed?

  def verify_phone_number
    return if /^(\+)?\d+$/.match?(phone_number)

    errors.add(:base,
               'Phone number must consist exclusively of numbers and the + sign at the beginning')
  end
end
