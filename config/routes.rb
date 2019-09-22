Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "products#index"

  devise_for :users
  resources :products, only: [:index, :show] do
    collection do
      post :search_sites
    end
  end
  resources :users
  
end
