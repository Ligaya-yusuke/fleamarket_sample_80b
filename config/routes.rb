Rails.application.routes.draw do
  # トップページへのリンク
  root 'items#index'
  # root to: 'sells#index'
  resources :sells, only: [:new, :create]
  
end
