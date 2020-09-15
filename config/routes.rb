Rails.application.routes.draw do
  # Active Admin
  ActiveAdmin.routes(self)
  # Devise
  devise_for :users
  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => "/sidekiq"
  end

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

  # Step Inheritence

  resources :sms_step, controller: :steps, :type => "SmsStep"
  resources :email_step, controller: :steps, :type => "EmailStep"
  resources :delay_step, controller: :steps, :type => "DelayStep"

  # api

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :quotes, only: [:index, :create]
    end
  end
end
