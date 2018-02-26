Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users do
    resources :bookings, only: [:show, :create, :update]
  end

  resources :activities do
    resources :reviews, only: [:create] #for new _form partial ==> look for ajax in rails lecture
  end


  resources :providers, only: [:new, :create, :update, :destroy]

end
