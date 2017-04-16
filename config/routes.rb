Rails.application.routes.draw do
  root 'websites#index'

  resources :websites, only: [:index, :destroy] do
    get :get_bookmarks, on: :member 
  end

  resources :bookmarks, except: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
