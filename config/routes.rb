
Rails.application.routes.draw do
mount Attachinary::Engine => "/attachnary"
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'users#dashboard'
  get '/dashboard/edit', to: 'users#edit'
  resources :users
  # resources :events, only: [:index]
  resources :activities do
    resources :events, only: [:new, :create]
  end

	resources :events, only: [:show] do
		resources :bookings, only: [:new, :create]
	end
	resources :bookings, only: [:update]

	resources :bookings, only: [:show] do
		resources :reviews, only: [:new, :create]
	end
end

