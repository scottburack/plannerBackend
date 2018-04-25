Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]
      post "/login", to: "sessions#create"
      post "/signup", to: "users#create"
      get "/current_user", to: "sessions#show"
    end
  end

end
