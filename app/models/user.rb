# frozen_string_literal: true

class User < ApplicationRecord
  has_many :doctor_users, dependent: :destroy
  has_many :doctors, through: :doctor_users
  has_one  :profile, as: :related_to, dependent: :destroy
end
