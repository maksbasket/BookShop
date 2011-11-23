Bookshop::Application.routes.draw do
  
  get "comments/new"
  get "comments/create"  

  get "store/index"

  resources :products do 
    resources :comments, :only => [:new, :create]
  end

  root :to => 'store#index', :as => 'store'
end
