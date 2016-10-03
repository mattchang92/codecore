Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => "auctions#index", as: :root

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :auctions, only: [:new, :create, :index, :show] do
    resources :bids, only: [:create]
    resources :publishings, only: [:create]
  end

end
