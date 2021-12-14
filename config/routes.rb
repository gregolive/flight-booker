Rails.application.routes.draw do
  resources :flights
  resources :bookings
  resources :passengers

  root 'flights#index'
end
