Rails.application.routes.draw do
  get 'ping'        =>  'ping#index'
  get 'healthcheck' =>  'health_check#index'

  scope '(:locale)', locale: /en|cy/ do

    devise_for :users
    resources :users

    authenticated :user do
      root to: 'redirect_urls#index', as: :authenticated_root
    end

    resources :redirect_urls

    root to: redirect('/users/sign_in')
  end
end
