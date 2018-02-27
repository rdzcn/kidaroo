Rails.application.routes.draw do
	resources :events, only: [:show] do
		resources :bookings, only: [:new, :create]
	end
	resources :bookings, only: [:update]

	resources :bookings, only: [:show] do
		resources :reviews, only: [:new, :create]
	end
end

