Rails.application.routes.draw do
  root 'tweets#index'

  resources :users, only: [:new, :create, :destroy, :show, :update]
  resources :sessions, only: [:new, :create, :destroy]

  get 'sessions/new'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  resources :tweets do
    resources :comments, only: [:create]
    resources :likes, only: %i[create destroy]
  end

  get 'likes/create'
  get 'likes/destroy'

  get '/follow/:id', to: 'follows#follow'
  delete '/follow/:id', to: 'follows#unfollow'
end
