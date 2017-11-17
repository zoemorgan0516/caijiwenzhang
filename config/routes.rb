require 'sidekiq/web'
require 'sidekiq/cron/web'


Rails.application.routes.draw do
  resources :clicks
  resources :messages
  resources :pictures
  devise_for :users


  mount Sidekiq::Web => '/admin/sidekiq'

  resources :pictures do
    resources :articles
  end

  resources :articles do
    resources :pictures
    resources :clicks
    resources :comments
    member do
      put :traffic_up
    end

    collection do
      get :ascending
      get :descending
      get :time_order
    end

  end

  namespace 'admin' do
    resources :messages
  end

  resources :messages do
    member do
      put :checked
      put :unchecked
    end
  end

  resources :labels do
    member do
      put :live
      put :unlive
    end
  end

  resources :users, :path => "what"


  root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
