Rails.application.routes.draw do
  resources :event_receivers
  resources :events
  resources :itineraries
  resources :receivers
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
