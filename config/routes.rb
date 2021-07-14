Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root "tops#index"
  resources :posts, only: [:new, :create, :show] do
    resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
end