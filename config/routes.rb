# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

  get 'login', to: 'login#index', as: 'login'
  get 'login/auth', to: 'login#auth', as: 'login_auth'
  get 'homepage', to: 'homepage#index', as: 'homepage'
  get 'homepage/comments', to: 'homepage#comments', as: 'comment'
  get 'user/:name', to: 'user#index', as: 'user'
  post 'user/comment', to: 'user#addComment', as: 'addComment'

  resources :comments
  resources :homepage
  root 'login#index'
end
