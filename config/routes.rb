Rails.application.routes.draw do
  resources :messages
  resources :pictures
  devise_for :users

  resources :pictures do
    resources :articles
  end

  resources :articles do
    resources :pictures
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
