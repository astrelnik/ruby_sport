Rails.application.routes.draw do
  get 'page/login'
  post 'page/login'
  devise_for :users
  get 'page/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
