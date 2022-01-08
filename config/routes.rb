require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

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

  # Articles
  get 'articles' => 'articles#index'
  get 'articles/new' => 'articles#new'
  post 'articles/add' => 'articles#add'
  get 'articles/:id' => 'articles#show', as: 'articles_show'
  get 'articles/:id/edit' => 'articles#edit', as: 'articles_edit'
  patch 'articles/:id/update' => 'articles#update', as: 'articles_update'
  delete 'articles/:id/delete' => 'articles#delete', as: 'articles_delete'

  # Categories
  get 'categories' => 'categories#index'
  get 'categories/new' => 'categories#new'
  post 'categories/add' => 'categories#add'
  get 'categories/:id' => 'categories#show', as: 'categories_show'
  get 'categories/:id/edit' => 'categories#edit', as: 'categories_edit'
  patch 'categories/:id/update' => 'categories#update', as: 'categories_update'
  delete 'categories/:id/delete' => 'categories#delete', as: 'categories_delete'

  get 'home', to: 'page#home'
end
