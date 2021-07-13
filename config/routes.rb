Rails.application.routes.draw do
  get 'posts/new'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root "tops#index"
  resources :posts, only: [:new, :create] do
    resources :photos, only: [:create]
  end
end