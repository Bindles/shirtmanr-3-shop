Rails.application.routes.draw do
  get 'cart/show'
  resources :products
  resources :logos do
    post 'rename', on: :collection
    collection do
      get 'get'
      get 'app'
      get 'logo_data'
    end
  end
  resources :colors do
    collection do
      get 'pass'
      get 'logofromcolor'
      get 'new2'
      get 'indexx'
      get 'test'
      get 'appz'
      get 'components'
    end
  end

  get 'tester' => 'application#tester'

  get 'pass' => 'colors#pass'
  get 'colors_and_logos', to: 'colors_and_logos#index'
  get 'testpr' => 'products#testpr'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  root 'products#index'
end
