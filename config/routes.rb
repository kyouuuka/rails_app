Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hello/index' => 'hello#index'
  root 'hello#index'
  get 'instas/my' => 'instas#my'
  post 'instas' => 'instas#create'
  resources :instas
end
