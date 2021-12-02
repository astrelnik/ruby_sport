Rails.application.routes.draw do
  get 'page/login'
  post 'page/login'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get 'page/sign_in', to: 'devise/sessions#new'
  end


  get 'page/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
