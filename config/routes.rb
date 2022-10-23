Rails.application.routes.draw do

  #管理者用
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  namespace :admin do
    get '' => 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :new, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit]
    resources :orders, only: [:show]
  end

  #顧客用
    root to: 'public/homes#top'
    get '/about' => 'public/homes#about'

    get '/items' => 'public/items#index'
    get '/items/:id' => 'public/items#show', as: 'item_show'

    get '/customers' => 'public/customers#show', as: 'customer_show'
    get '/customers/information/edit' => 'public/customers#edit', as: 'customer_edit'
    patch '/customers/information' => 'public/customers#update', as: 'customer'
    get '/customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdraw' => 'public/customers#withdraw', as: 'withdraw'

    get '/cart_items' => 'public/cart_items#index'
    patch '/cart_items/:id' => 'public/cart_items#update', as: 'cart_item_update'
    delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all', as: 'destroy_all'
    delete '/cart_items/:id' => 'public/cart_items#destroy', as: 'cart_item_destroy'
    post '/cart_items' => 'public/cart_items#create', as: 'cart_item_create'

    get '/orders/new' => 'public/orders#new'
    post '/orders/comfirm' => 'public/orders#comfirm'
    get '/orders/complete' => 'public/orders#complete'
    post '/orders' => 'public/orders#create', as: 'order_create'
    get '/orders' => 'public/orders#index'
    get '/orders/:id' => 'public/orders#show', as: 'order_show'

    get '/addresses' => 'public/addresses#index'
    get '/addresses/:id/edit' => 'public/addresses#edit', as: 'address_edit'
    post '/addresses' => 'public/addresses#create', as: 'address_create'
    patch '/addresses/:id' => 'public/addresses#update', as: 'address_update'
    delete '/addresses/:id' => 'public/addresses#destroy', as: 'address_destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
