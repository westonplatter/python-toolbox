Rails.application.routes.draw do
  get 'home/index'

  get 'hello_world', to: 'hello_world#index'

  # get '/search' => 'packages#search'
  #
  # resoures :packages

  root 'home#index'
end
