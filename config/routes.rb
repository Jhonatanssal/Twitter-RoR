Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  resources :tweets do
    resources :comments, only: [:create]
    resources :likes, only: %i[create destroy]
  end
  root 'tweets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'sessions/new'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get '/follow/:id', to: 'follows#follow'
  delete '/follow/:id', to: 'follows#unfollow'
end
