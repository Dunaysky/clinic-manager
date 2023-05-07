ActiveAdmin.register DoctorUser, as: 'Appointments' do
  permit_params :doctor_id,
                :recommendation,
                :status
  form do |f|
    f.semantic_errors *f.object.errors
    
    inputs 'Appointment Details' do
      input :doctor
      input :recommendation
      input :status
    end

    actions
  end
end
