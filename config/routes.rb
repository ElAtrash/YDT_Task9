Rails.application.routes.draw do
  resources :users
  resources :friends, controller: :users, type: 'Friend'
  resources :neutralities, controller: :users, type: 'Neutrality'
  resources :enemies, controller: :users, type: 'Enemy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "users#index"
end
