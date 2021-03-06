Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }

  root to: "pages#home"

  
  get "items/index", to: "items#index", as: "items_home"
  get "items/new", to: "items#new", as: "items"
  get "items/users_items", to: "items#user_items"
  post "items/new", to: "items#create"
  get "items/:id", to: "items#show", as: "item"
  get "items/:id/edit", to: "items#edit", as: "edit_item"
  patch "items/:id", to: "items#update"
  put "items/:id", to: "items#update"
  delete "items/:id", to: "items#delete", as: "delete"
  get "profiles/new", to: "profiles#new", as: "profiles"
  post "profiles/new", to: "profiles#create"
  get "profiles/:id/edit", to: "profiles#edit", as: "edit_profile"
  patch "profiles/:id", to: "profiles#update"
  put "profiles/:id", to: "profiles#update"
  get "profiles/:id", to: "profiles#show", as: "profile"
  get "pages/categories/:id", to: "pages#categories", as: "category"
  get "purchase/:id", to: "boughts#purchase", as: "purchase"
  get "purchase/confimation/item/:id", to: "items#buy"
  get "items/user/order_history", to: "items#order_history", as: "order_history"
  get "profile/finder", to: "profiles#finder"
  get "profile/found/:id", to: "profiles#found"
  get "profile/:zip", to: "profiles#found"
  get "profile/:city", to: "profiles#found"
  get "profile/:state", to: "profiles#found"
  get "profile/:country", to: "profiles#found"
end
