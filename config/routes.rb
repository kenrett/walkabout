Rails.application.routes.draw do

  root 'home#index'

  resources 'guides', :only => [:new, :create, :index]
end
