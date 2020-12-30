Rails.application.routes.draw do

  get 'comments/new'
  get 'comments/edit'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  delete '/logout', to: "sessions#destroy"
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  root "home#top"
  resources :boards
  resources :categories
  resources :users
  post '/boards/:id', to: "comments#create"
  resources :comments

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
