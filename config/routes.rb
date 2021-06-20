Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'blogs#index'
  resources :blogs do
    # post 'comments', to: 'comments#create'
    resources :comments, only: [:create, :destroy]
  end
  resources :categories
  resources :users
  # get 'users/:id', to:'users#show', as: :user
end
