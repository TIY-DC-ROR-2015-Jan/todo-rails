Rails.application.routes.draw do
  devise_for :users

  resources :lists do
    resources :todos, only: [:new, :create] do
      member do
        post :complete
      end
    end
  end

  root to: 'lists#index'
end
