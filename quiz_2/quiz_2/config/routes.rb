Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :requests
  get "/requests/update/:id" => "requests#index", as: :request_update
  post "/requests/:search" => "requests#index", as: :request_search

end
