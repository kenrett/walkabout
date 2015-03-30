Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  resources 'guides', :only => [:new, :create, :index]
end
