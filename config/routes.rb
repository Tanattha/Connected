Rails.application.routes.draw do
  root 'sessions#home'
  
  resources :users 
  resources :conversations do
    resources :messages
   end
  resources :posts 
  resources :comments
  resources :categories 
 
  resources :rooms
  resources :room_messages
  
  get 'auth/google_oauth2/callback', to: 'omniauth#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  
  
end
