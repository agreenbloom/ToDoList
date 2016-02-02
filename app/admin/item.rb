ActiveAdmin.register Item do
	  menu priority: 1, label: "item" 

	index do
		column :title
		column :description
		column :state
	end


end
