Rails.application.routes.draw do

  get 'credit_card/new'
  get 'credit_card/show'
  get 'credit_card/destroy'
  get 'users/show'
  get 'users/sign_out'



  root 'items#index'
  resources :items, only: [:index, :show]
  resources :categories, only: [:index, :show, :edit,]
  resources :products do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      post 'purchase'
      get 'purchased'
      get 'buy'
    end
    resources :purchase, only: [:index] do
      collection do
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
      member do
        get 'index', to: 'purchase#index'
        post 'buy', to: 'purchase#buy'
      end
    end
  end
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"

  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    delete 'users/destroy', to: 'devise/sessions#destroy'
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
