Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: :registrations }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'homes#index'

  resources :users, only: [:index, :show, :create, :destroy]

  resources :curricula, only: :index
end
