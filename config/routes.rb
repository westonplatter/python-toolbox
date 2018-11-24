require 'sidekiq/web'
require 'sidekiq/throttled/web'

Rails.application.routes.draw do
  devise_for :users

  authenticate :user, lambda { |u| u.admin? } do
    Sidekiq::Throttled::Web.enhance_queues_tab!
    mount Sidekiq::Web => '/sidekiq'
  end

  get '/' => "home#index"

  get '/search' => 'packages#search'

  resources :packages,
    :constraints => { :id => /([^\/]+?)(?=\.json|\.html|$|\/)/ } do
  end

  resources :categories do
  end

  get "/phpMyAdmin/scripts/setup.php", to: 'home#empty_response'
  get "/otsmobile/app/mgs/mgw.htm", to: 'home#empty_response'
  get "/bea_wls_deployment_internal", to: 'home#empty_response'
  get "/status", to: 'home#empty_response'

  root to: 'home#index'
end
