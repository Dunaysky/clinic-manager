# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(AdminUser)
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :read, User
      can :manage, AdminUser
      can :manage, Profile
      can :manage, Doctor
      can :manage, Category
      can :manage, DoctorUser
      cannot :destroy, DoctorUser
    elsif user.doctor?
      can :manage, Profile
      can [:read, :update], DoctorUser
    elsif user.user?
      can :read, Doctor
      can :manage, Profile
      can [:read, :create], DoctorUser
    end
  end
end
