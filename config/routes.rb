Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/users/sign_in", to: "devise/sessions#new"
  get "/users/sign_up", to: "devise/registrations#new"
end
