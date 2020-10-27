Rails.application.routes.draw do
  root 'items#index'
  resources :category, only: [:index, :show]
  resources :subcategory, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
