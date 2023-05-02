class DoctorUsersController < ApplicationController
  def create
    @appointment = DoctorUser.new(appointment_params)
    if @appointment.save
      redirect_to root_path,
                  flash: { notice: 'Appointment was successfully created.' }
    else
      redirect_to root_path,
                  flash: { error: @appointment.errors.full_messages.to_sentence }
    end
  end

  private

  def appointment_params
    params.permit(:doctor_id, :user_id)
  end
end