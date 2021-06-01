Rails.application.routes.draw do
  root to: 'pages#home'
  get '/question', to: 'pages#question'
end
