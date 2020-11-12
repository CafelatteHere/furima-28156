Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users, only: %i[edit update]
  resources :items, only: %i[new create edit update show destroy] do
    resources :orders, only: %i[index]
  end
end
