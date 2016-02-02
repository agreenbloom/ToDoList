Rails.application.routes.draw do

  # devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config
	root "items#index"
  resources :items, except: [:edit, :update]

  
end
