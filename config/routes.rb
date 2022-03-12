Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  get "items/index", to: "items#index"
  get "items/new", to: "items#new", as: "items"
  post "items/new", to: "items#create"
  get "items/:id", to: "items#show", as: "item"
  get "items/:id/edit", to: "items#edit", as: "edit_item"
  patch "items/:id", to: "items#update"
  put "items/:id", to: "items#update"
  
end
