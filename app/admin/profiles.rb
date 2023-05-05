ActiveAdmin.register Profile do
  permit_params :first_name,
                :last_name,
                :phone_number,
                :category,
                :related_to_type,
                :related_to_id,
                :password

  before_create do |resource|
    resource.related_to_type = 'Doctor'
  end

  filter :first_name
  filter :last_name
  filter :phone_number
  filter :related_to_type
  filter :created_at
  filter :updated_at
  
  index do
    id_column
    column :first_name
    column :last_name
    column :phone_number
    column :related_to_type
    column :related_to

    actions dropdown: true
  end

  form do |f|
    f.semantic_errors *f.object.errors

    inputs 'Profile Details' do
      input :first_name
      input :last_name
      input :phone_number
      input :password
      input :related_to, label: "Doctor", as: :select, collection: Doctor.all
    end

    actions
  end

  show do
    attributes_table title: 'Profile Details' do
      row :id
      row :first_name
      row :last_name
      row :phone_number
      row :related_to_type
      row :related_to
      row :created_at
      row :updated_at
    end
  end
end
