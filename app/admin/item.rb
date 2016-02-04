ActiveAdmin.register Item do
  menu priority: 1, label: "Items"

  permit_params :title, :description, :state, :user_id


  index do
    column :title
    column :description
    column :state
    actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :title
      f.input :description
      f.input :state
      f.input :user_id
      end
    f.actions
    end


end