Rails.application.routes.draw do
  root to: 'pages#home'
  get '/question', to: 'pages#question'
  get '/privacy', to: 'pages#privacy'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: "users/registrations"
  }
  resources :users, only: [:show]

  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resources :photos, only: [:create]
  end
end
