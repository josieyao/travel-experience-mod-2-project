Rails.application.routes.draw do
  resources :event_receivers
  resources :events
  resources :itineraries
  resources :receivers
  resources :users
  resources :sessions
  root 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get '/itineraries/:id/send_mail', to: 'itineraries#send_mail'
end
