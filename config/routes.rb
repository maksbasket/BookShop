Bookshop::Application.routes.draw do

  resources :line_items, :only => [:create]

  get 'store' => 'store#index'
  get 'cart' => 'cart#show'
  delete 'cart/destroy' => 'carts#destroy'

  resources :products do 
    resources :comments, :only => [:new, :create]
  end

  root :to => 'store#index'
end
