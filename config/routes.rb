Rails.application.routes.draw do
  devise_for :users
  root 'page#home'

  get 'login' => 'page#login'
  post 'login', to: 'page#check_user'
  get 'register', to: 'page#register'
  post 'add_user', to: 'page#add_user'
  get 'forgot', to: 'page#forgot'
  get 'password', to: 'page#password'
  get 'email_sent', to: 'page#email_sent'

  # resources :posts

  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get 'page/sign_in', to: 'devise/sessions#new'
  end


  get 'home', to: 'page#home'
end
