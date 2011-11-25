Bookshop::Application.routes.draw do

  devise_for :users

  resources :orders, :only => [:new, :create, :index, :show] do
    put 'ship', :on => :member
  end

  resources :line_items, :only => [:create, :destroy]

  get 'store' => 'store#index'
  delete 'cart/destroy' => 'carts#destroy'

  resources :products do 
    resources :comments, :only => [:new, :create]
    get :who_bought, :on => :member
  end

  root :to => 'store#index'
end
