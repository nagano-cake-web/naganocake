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
    get '/customers' => 'public/customers#show'
    get '/customers/information/edit' => 'public/customers#edit'
    get '/customers/information' => 'public/customers#update'
    get '/customers/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    get '/customers/withdraw' => 'users#withdraw', as: 'withdraw'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
