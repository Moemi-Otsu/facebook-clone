Rails.application.routes.draw do
  get '/blogs', to: 'blogs#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
end