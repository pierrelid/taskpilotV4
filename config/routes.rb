Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  # roots
  root "quotes#index"

  resources :quotes
  resources :lists
  resources :workflows

  # api

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :quotes, only: [:index, :create]
    end
  end
end
