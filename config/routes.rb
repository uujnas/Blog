Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'blogs#index'
  resources :blogs
  resources :categories
  resources :users
end
