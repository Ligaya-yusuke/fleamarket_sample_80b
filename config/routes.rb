Rails.application.routes.draw do
  # トップページへのリンク
  root to: 'items#index'

  #出品機能へのリンク
  get 'sells', to:'sells#new'
  post'sells/posts', to:'sells#create'

  resources :items, only: [:index]
  resources :sells, only: [:index, :new, :create]

end