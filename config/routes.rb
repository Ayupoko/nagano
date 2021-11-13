Rails.application.routes.draw do


devise_for :customers, controllers: {
  sessions: 'customers/sessions',
  registrations: 'customers/registrations'
}
devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}
  resources :order_details, only: [:update, :create]
  resources :items
  resources :cart_items do
   collection do
      delete 'destroy_all'
   end
  end

  get "/orders/thanks" => "orders#thanks", as: 'orders_thanks'
  resources :orders
  post "/orders/confirm" => "orders#confirm", as: 'orders_confirm'
  resources :addresses
  get "/customers/quit" => "customers#quit", as: 'customers_quit'
  patch "/customers/out" => "customers#out", as: 'customers_out'
  resources :customers, only: [:show, :edit, :update]
  root to: 'homes#top'
  get 'homes/about'



  namespace :admin do
    get 'customer/index'
    get 'customer/show'
    get 'customer/edit'
    get 'homes/top'
  end

  namespace :admin do
    resources :genres
    resources :items
    resources :customers
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end


end
