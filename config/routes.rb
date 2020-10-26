Rails.application.routes.draw do
  # トップページへのリンク
  root 'items#index'
  # root to: 'sells#index'
  resources :items, only: [:index]
  resources :sells, only: [:new, :create]
end
