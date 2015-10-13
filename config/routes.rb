Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: :registrations }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'homes#index'

  resources :users, only: [:create, :destroy, :index, :show] do
    resources :admin, only: :create
  end
  
  resources :admin, only: [:create, :destroy, :index]

  resources :curricula, only: [:index, :show]

  resources :assignments, only: [:show]
end
