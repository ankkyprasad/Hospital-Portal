Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  authenticated :user do
    root to: 'home#dashboard', as: :authenticated_root
  end

  root 'home#index'

  get '/profile/edit', to: 'profile#edit', as: :edit_profile

  resources :doctors, only: %i[update]
  resources :appointments
end
