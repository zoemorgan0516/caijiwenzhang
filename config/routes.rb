Rails.application.routes.draw do
  resources :pictures
  devise_for :users


  resources :articles do
    resources :pictures
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
