Rails.application.routes.draw do
  get 'bookings/new'

  get 'bookings/create'

  get 'bookings/show'

  get 'bookings/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
