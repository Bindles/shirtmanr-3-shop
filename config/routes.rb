Rails.application.routes.draw do
  resources :logos do
    collection do
      get 'app'
    end
  end
  resources :colors do
    collection do
      get 'test'
      get 'appz'
    end
  end


  get 'colors_and_logos', to: 'colors_and_logos#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
