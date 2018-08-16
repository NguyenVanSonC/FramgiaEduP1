Rails.application.routes.draw do
  get "search_products/index"
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/contact", to: "static_pages#contact"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "filter_items", to: "products#filter_products", as: "filter_items"
  resources :users
  resources :products
  resources :categories
  namespace :admin do
    resources :products
    resources :search_products
  end
end
