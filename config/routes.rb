Rails.application.routes.draw do
  root 'sessions#home'
  
  resources :users
  resources :posts 
  resources :comments
  resources :categories 
  
  get 'auth/google_oauth2/callback', to: 'omniauth#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

end
