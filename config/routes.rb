Rails.application.routes.draw do

  resources :images
  #devise_for :users, :controllers => { registrations: 'registrations' }
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_scope :user do get '/users/sign_out' => 'devise/sessions#destroy' end


  post 'user/create' => 'users#create'

  post 'authenticate' => 'users#login_verify'
  get 'products' => 'products#list'
  post 'product/update/:id' => 'products#update'
  patch 'product/update/:id' => 'products#update'
  get 'product/edit/:id' => 'products#edit'
  get 'product/new' => 'products#new'
  post 'product/create' => 'products#create'
  get 'product/:id' => 'products#show'
  get 'search_product' => 'products#search'

  get 'user/profile' => 'users#profile'
  post 'update_profile' => 'users#update'
  patch 'user/:id/update_profile' => 'users#update'

  get 'basket/put' => 'baskets#put'
  get 'basket/put_resume' => 'baskets#put_resume'
  get 'basket/cancel_product/:product_id' => 'baskets#cancel_product'
  get 'basket/show/:id' => 'baskets#show'
  get 'basket' => 'baskets#basket'
  get 'basket/index' => 'baskets#index'
  get 'basket/reset' => 'baskets#reset_basket'
  get 'basket/basket_details' => 'baskets#basket_details'
  get 'basket/basket_modal' => 'baskets#basket_modal'



  get 'products/csv' => 'products#export_to_csv'

  get 'categories/:id' => 'categories#show'
  get 'categories' => 'categories#list'

  root 'products#list'

end
