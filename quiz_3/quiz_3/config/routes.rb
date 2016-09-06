Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'ideas#index'

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :ideas do
    resources :likes, only: [:create, :destroy]
    resources :memberships, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

end
