Rails.application.routes.draw do

  #管理者用
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get '' => 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :new, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit]
    resources :orders, only: [:show]
  end

  #顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :public do
    get '/' => 'homes#top'
    get '/about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
