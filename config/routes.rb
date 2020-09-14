Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  # roots
  root "quotes#index"

  resources :quotes
  resources :lists
  resources :workflows do
    resources :steps do
      member do
        patch :move
      end
    end
  end

  # api

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :quotes, only: [:index, :create]
    end
  end
end
