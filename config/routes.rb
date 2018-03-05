
Rails.application.routes.draw do
  get 'messages/new'

  get 'messages/index'

  get 'messages/create'

  get 'messages/destroy'

mount Attachinary::Engine => "/attachnary"
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'users#dashboard'
  get '/dashboard/edit', to: 'users#edit'
   # get "activities/:id", to: "activities#show" //crashes creating new activity
  resources :users
  # resources :events, only: [:index]
  resources :activities do
    resources :events, only: [:new, :create]
  end

	resources :events, only: [:show] do
		resources :bookings, only: [:new, :create]
	end

	resources :bookings, only: [:show, :update] do
		resources :reviews, only: [:new, :create]
    resources :payments, only: [:new, :create]
	end
end

