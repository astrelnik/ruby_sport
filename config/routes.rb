require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  scope '(:locale)', locale: /#{I18n.config.available_locales.join('|')}/ do
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
    resources :articles

    get 'articles/:id/filter' => 'articles#filter', as: 'articles_filter'

    # Categories
    get 'categories' => 'categories#index'
    get 'categories/new' => 'categories#new'
    post 'categories/add' => 'categories#add'
    get 'categories/:id' => 'categories#show', as: 'categories_show'
    get 'categories/:id/edit' => 'categories#edit', as: 'categories_edit'
    patch 'categories/:id/update' => 'categories#update', as: 'categories_update'
    delete 'categories/:id/delete' => 'categories#delete', as: 'categories_delete'

    # Subcategories
    get 'subcategories' => 'subcategories#index'
    get 'subcategories/new' => 'subcategories#new'
    post 'subcategories/add' => 'subcategories#add'
    get 'subcategories/:id' => 'subcategories#show', as: 'subcategories_show'
    get 'subcategories/:id/edit' => 'subcategories#edit', as: 'subcategories_edit'
    patch 'subcategories/:id/update' => 'subcategories#update', as: 'subcategories_update'
    delete 'subcategories/:id/delete' => 'subcategories#delete', as: 'subcategories_delete'

    get 'home', to: 'page#home'
  end
end
