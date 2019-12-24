require 'sidekiq/web'

Rails.application.routes.draw do
  resources :meetings do
    resources :comments
  end
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  devise_for :users
  get 'active_sessions', to: "meetings#active_sessions"
  root to: 'home#index'
  resources :users, only: [:index]
end
