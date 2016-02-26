Rails.application.routes.draw do
  devise_for :users

  root 'front_pages#index'
  resource :user, only: :show
  resources :charges, only: [:new, :create]

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
