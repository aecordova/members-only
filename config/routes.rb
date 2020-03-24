Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:create]
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'


end
