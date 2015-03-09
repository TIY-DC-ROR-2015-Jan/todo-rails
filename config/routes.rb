Rails.application.routes.draw do
  devise_for :users

  resources :lists do
    resources :todos do
      post :complete
    end
  end

  root to: 'lists#index'
end
