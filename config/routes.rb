Rails.application.routes.draw do
  resources :event_receivers
  resources :events
  resources :itineraries
  resources :receivers
  resources :users
  resources :sessions
  resources :event_users
  resources :friendships
  root 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get '/itineraries/:id/send_mail', to: 'itineraries#send_mail'
  get '/itinerary/:id/delete', to: 'itineraries#destroy'
  # get '/events/:id/receivers', to: 'event_receivers#index'
end
