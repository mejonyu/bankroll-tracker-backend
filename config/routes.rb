Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions
  resources :user_sessions
  resources :users

  post '/login', to: 'users#login'
  post '/index_for_user', to: 'sessions#index_for_user'
end
