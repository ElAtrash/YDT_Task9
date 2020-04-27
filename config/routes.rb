Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :users
  resources :friends, controller: :users, type: 'Friend'
  resources :neutralities, controller: :users, type: 'Neutrality'
  resources :enemies, controller: :users, type: 'Enemy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "publics#index"

  # authenticate :user do
  #   resources :users, only: [:show, :index]
  # end
end
