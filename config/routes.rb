Rails.application.routes.draw do
  get 'appointment/index'
  get 'appointment/show'
  get 'appointment/new'
  root 'doctors#index'

  resources :users
  resources :doctors do
    resources :appointments, only: [:index, :new, :create, :destroy]
  end
end
