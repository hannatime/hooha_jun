HoohaJun::Application.routes.draw do
  get "content/free"
  get "content/silver"
  get "content/gold"
  get "content/platinum"
  root "pages#home"    
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get "about", to: "pages#about", as: "about"
  get "feature", to: "pages#feature", as: "feature"
  
  match '/contacts',  to: 'contacts#new',  via: 'get'
  resources "contacts", only: [:new, :create]
  
  devise_for :users, :controllers => { :registrations => 'registrations' }
  
  namespace :admin do
    root "base#index"
    resources :users
  end
  
end
