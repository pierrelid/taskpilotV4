Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  # roots
  root "quotes#index"

  # quotes
  resources :quotes
end
