Rails.application.routes.draw do
  root to: 'pages#home'
  get '/question', to: 'pages#question'
  get '/privacy', to: 'pages#privacy'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
