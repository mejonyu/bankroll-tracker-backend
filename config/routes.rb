Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions
  resources :user_sessions
  resources :users

  post '/login', to: 'users#login'
  get '/statistics/:id', to: 'users#statistics'
  post '/overall_user_sessions', to: 'sessions#overall_user_sessions'
end
