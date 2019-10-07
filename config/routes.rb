Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :articles
  resources :article2s
  resources :categories
  resources :comments
  resources :roles
  resources :users
  resources :page
  devise_for :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
