UrlShortenerRails::Application.routes.draw do
  root to: "urls#index"

  resources :urls, only: [:index, :create, :update]

  resources :users, except: [:index, :new] do
    resources :urls, only: [:index, :create, :update, :destroy]
  end

  resources :sessions, only: [:new, :create, :destroy]

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

end