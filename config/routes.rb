Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  get "items/index", to: "items#index"
  get "items/new", to: "items#new", as: "items"
  post "items/create", to: "items#create"
  
end
