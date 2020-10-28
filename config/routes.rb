Rails.application.routes.draw do
  devise_for :users

  resources :users, only:[:update, :edit]
end
