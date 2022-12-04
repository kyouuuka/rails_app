Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hello/index' => 'hello#index'
  root 'hello#index'
  get 'instas/my' => 'instas#my'
  resources :instas
end
