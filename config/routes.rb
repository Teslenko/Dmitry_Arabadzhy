Rails.application.routes.draw do


  devise_for :admins
  devise_for :users
  resources :users

  get 'persons/profile'

  # devise_for :users
  # devise_for :users, controllers: { sessions: 'users/sessions' }


  get '/home' => 'static_pages#home'
  get '/help' => 'static_pages#help'
  get '/contact'=> 'static_pages#contact'
  get '/about' => 'static_pages#about'

  get :search, controller: :candidates
  get :autocomplete, controller: :candidates

  root  'static_pages#home'

  get 'persons/profile', as: 'user_root'

  resources :candidates

  root  'candidates#index'


end
