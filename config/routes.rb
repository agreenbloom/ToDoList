Rails.application.routes.draw do

  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords'}, path_names: { sign_in: 'login', sign_out: 'logout' }
  devise_scope :user do
    get 'logout', :to => 'devise/sessions#destroy', method: :delete
    get "login", :to => "devise/sessions#new"
    authenticated :user do
      root :to => 'admin/dashboard#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'items#index', as: :unauthenticated_root
    end
  end
  ActiveAdmin.routes(self)
	#root "items#index"
  resources :items, except: [:edit, :update]



end
