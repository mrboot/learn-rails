Rails.application.routes.draw do

  post '/genxml', to: 'baskets#genxml'
  resources :baskets

  resources :contacts, only: [:new, :create]
  resources :visitors, only: [:new, :create]
  root to: 'visitors#new'

end
