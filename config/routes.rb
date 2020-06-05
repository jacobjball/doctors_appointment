Rails.application.routes.draw do
  root 'doctors#index'

  resources :users
  resources :doctors
end
