Rails.application.routes.draw do
  resources :event_receivers
  resources :events
  resources :itineraries
  resources :receivers
  resources :users
  resources :sessions
  resources :event_users
  root 'sessions#new'
  get 'logout', to: 'sessions#destroy'
end
