Rails.application.routes.draw do

  root 'home#index'

  resource 'guide'
end
