# frozen_string_literal: true

FactoryBot.define do
  factory :doctor_user do
    doctor
    user
    status { 0 }
    date { Faker::Time.forward(days: 5) }
  end
end
