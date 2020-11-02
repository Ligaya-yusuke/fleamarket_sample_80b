Rails.application.routes.draw do

  resources :categories, only: [:index, :show]
  resources :products, only: [:new, :create, :show] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end


  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: 'items#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :items, only: [:index, :show]

  # resources :users
  
  # トップページへのリンク
  # root 'items#index'
  # root to: 'sells#index'
  

end
