Bookshop::Application.routes.draw do

  get "store/index"

  resources :products do 
    resources :comments, :only => [:new, :create]
  end

  root :to => 'store#index'
end
