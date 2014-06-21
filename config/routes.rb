HoohaJun::Application.routes.draw do
  root "pages#home"    
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  
  match '/contacts',  to: 'contacts#new',    via: 'get'
  resources "contacts", only: [:new, :create]
    
  devise_for :users
  
  namespace :admin do
    root "base#index"
    resources :users
  end
  
end
