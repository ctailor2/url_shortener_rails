UrlShortenerRails::Application.routes.draw do
  root to: "urls#index"

  resources :users, except: [:index, :new]
  resources :urls, only: [:index, :create, :update]
  resources :sessions, only: [:new, :create, :destroy]

  match '/signup', to: 'users#new', via: :get
  match '/signin', to: 'sessions#new', via: :get
  match '/signout', to: 'sessions#destroy', via: :delete

end