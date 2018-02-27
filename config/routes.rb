Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
	resources :events, only: [:show] do
		resources :bookings, only: [:new, :create]
	end
	resources :bookings, only: [:update]

	resources :bookings, only: [:show] do
		resources :reviews, only: [:new, :create]
	end
end

