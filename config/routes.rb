Rails.application.routes.draw do
  resources :event_receivers
  resources :events
  resources :itineraries
  resources :receivers
  resources :users
  resources :sessions
  root 'sessions#new'
  '/logout'
end
