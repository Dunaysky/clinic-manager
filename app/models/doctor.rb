# frozen_string_literal: true

class Doctor < ApplicationRecord
  belongs_to :category
  has_many   :doctor_users, dependent: :destroy
  has_many   :users, through: :doctor_users
  has_one    :profile, as: :related_to, dependent: :destroy
end
