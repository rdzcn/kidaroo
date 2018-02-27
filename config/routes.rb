Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :activities do
    resources :events, only: [:new, :create]
  end

  resources :events, only: [:show] do
    resources :bookings, only: [:new, :create, :update]
  end

  resources :bookings, only: [:show] do
    resources :reviews, only: [:new, :create]
  end

    resources :providers, only: [:new, :create, :update, :destroy]

end
