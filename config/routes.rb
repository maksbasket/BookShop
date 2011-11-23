Bookshop::Application.routes.draw do

  resources :line_items, :only => [:create]

  get 'cart'
  get "store/index"

  resources :products do 
    resources :comments, :only => [:new, :create]
  end

  root :to => 'store#index'
end
