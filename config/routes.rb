require 'sidekiq/web'
require 'sidekiq/throttled/web'

Rails.application.routes.draw do
  devise_for :users

  authenticate :user, lambda { |u| u.admin? } do
    Sidekiq::Throttled::Web.enhance_queues_tab!
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'home#index'
  get '/' => "home#index"

  # get '/search' => 'repos#search'
  # get '/about'    => 'home#about'
  # get '/contact'  => 'home#contact'
  # get '/services' => 'home#services'
  # get '/thankyou' => 'home#thankyou'

  get '/search' => 'packages#search'

  resources :packages,
    :constraints => { :id => /([^\/]+?)(?=\.json|\.html|$|\/)/ } do
  end

  # resources :authors,
  #   only: [:show, :edit, :update],
  #   path: '/',
  #   :constraints => { :id => /([^\/]+?)(?=\.json|\.html|$|\/)/ } do
  #
  #   resources :repos,
  #     :only =>  [:search, :show, :edit, :update, :destroy],
  #     :path => '/',
  #     :constraints => { :author_id => /([^\/]+?)(?=\.json|\.html|$|\/)/, :id => /([^\/]+?)(?=\.json|\.html|$|\/)/ } do
  #
  #       member do
  #         post :enqueue_upsert
  #       end
  #   end
  # end
end
