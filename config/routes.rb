Wedding::Application.routes.draw do

  root :to => 'home#index'

  resources :responses, :except => [:new, :show]

end
