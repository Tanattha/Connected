Rails.application.routes.draw do
  root 'sessions#home'
  
  resources :users 
  resources :categories 
  resources :conversations do
    resources :messages
   end
  resources :posts 
  resources :comments

  resources :rooms
  resources :room_messages
  
  get 'auth/google_oauth2/callback', to: 'omniauth#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

<<<<<<< HEAD
=======
 
  
>>>>>>> d0da87616b6e85ff73c31a58ef767a8dfa1e7514
end
