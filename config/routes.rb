Rails.application.routes.draw do
  root 'page#home'

  get 'login' => 'page#login'
  post 'login', to: 'page#register'
  get 'register', to: 'page#register'
  get 'add_user', to: 'page#add_user'
  get 'forgot', to: 'page#forgot'
  get 'password', to: 'page#password'

  # resources :posts

  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get 'page/sign_in', to: 'devise/sessions#new'
  end


  get 'home', to: 'page#home'
end
