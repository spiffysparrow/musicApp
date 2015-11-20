Rails.application.routes.draw do
  resources :users
  resource :session, only: [:new, :create, :destroy]

  resources :bands
  resources :albums
  resources :tracks
end
