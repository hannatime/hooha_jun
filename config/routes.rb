HoohaJun::Application.routes.draw do
  resources :leads

  resources :tasks

  resources :customers

  resources :opportunities

  root "pages#home"  
  # get "content/free"
  # get "content/silver"
  # get "content/gold"
  # get "content/platinum"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get "dashboard", to: "pages#dashboard", as: "dashboard"
  get "about", to: "pages#about", as: "about"
  get "feature", to: "pages#feature", as: "feature"
  get "plans", to: "pages#plans", as: "plans"
  
  get "contacts", to: "contacts#new", as: 'feedback'
  resources "contacts", only: [:new, :create]
  
  get "accounts", to: "accounts#index", as: 'accounts'
  resources :accounts

  devise_for :users, :controllers => { :registrations => 'registrations' }
  
  namespace :admin do
    root "base#index"
    resources :users
  end
  
end
