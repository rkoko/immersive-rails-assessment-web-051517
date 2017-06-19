Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :appearances

  resources :episodes, only: [:index, :show]

  resources :guests, only: [:index, :show]

  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'


end
