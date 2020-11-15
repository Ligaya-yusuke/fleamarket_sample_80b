Rails.application.routes.draw do
  get 'credit_card/new'
  get 'credit_card/show'
  get 'credit_card/destroy'
  get 'users/show'
  root 'items#index'
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
    registrations: "users/registrations"
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'users/destroy', to: 'devise/sessions#destroy'
  end
  

  resources :items, only: [:index, :show]
  resources :users, only: [:show]
  resources :credit_card, only: [:new, :show, :delete] do
    collection do
      post 'show', to: 'credit_card#show'
      post 'pay', to: 'credit_card#pay'
      post 'delete', to: 'credit_card#delete'
    end
  end
end
