Rails.application.routes.draw do
  resources :qiandaos
  resources :pictures
  devise_for :users

  resources :pictures

  resources :articles do
    resources :pictures
  end


  resources :labels do
    member do
      put :live
      put :unlive
    end
  end

  resources :users, :path => "what" do
    resources :qiandaos
    member do
      put :sign
    end
  end


  root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
