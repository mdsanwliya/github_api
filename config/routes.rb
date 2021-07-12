Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'dashboard#show'

  # Dashboard
  get '/dashboard', to: 'dashboard#show', as: 'dashboard'

  # Session 
  get 'session/new', as: 'sign_in'
  delete 'session',  to: 'session#destroy', as: 'sign_out'
  get '/auth/github/callback', to: 'session#create'
end
