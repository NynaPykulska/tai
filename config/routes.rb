# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

  get 'login', to: 'login#index', as: 'login'
  get 'login/auth', to: 'login#auth', as: 'login_auth'
  get 'homepage', to: 'homepage#index', as: 'homepage'
  get 'user/:name', to: 'user#index', as: 'user'
  get 'user/comment', to: 'user#addComment', as: 'addComment'

  resources :comments
  resources :homepage
  root 'login#index'
end
