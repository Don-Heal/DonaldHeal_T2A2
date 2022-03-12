Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }

  root to: "pages#home"

  get "items/index", to: "items#index", as: "items_home"
  get "items/new", to: "items#new", as: "items"
  post "items/new", to: "items#create"
  get "items/:id", to: "items#show", as: "item"
  get "items/:id/edit", to: "items#edit", as: "edit_item"
  patch "items/:id", to: "items#update"
  put "items/:id", to: "items#update"
  delete "items/:id", to: "items#delete", as: "delete"
  get "profiles/new", to: "profiles#new", as: "profiles"
  post "profiles/new", to: "profiles#create"
  get "profiles/:id/edit", to: "profile#edit", as: "edit_profile"
  patch "profiles/:id", to: "profile#update"
  put "profiles/:id", to: "profile#update"
  get "profile/:id", to: "profile#show", as: "profile_home"
  
end
