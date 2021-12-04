Rails.application.routes.draw do
  root 'page#home'

  get 'login' => 'page#login'
  post 'login', to: 'page#register'

  # resources :posts

  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get 'page/sign_in', to: 'devise/sessions#new'
  end


  get 'home', to: 'page#home'
end
