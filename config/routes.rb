Rails.application.routes.draw do
  devise_for :users, path: "", path_names: {sign_in: "login", sign_up: "register", sign_out: "logout"}
  resources :blogs
  resources :portfolios, except: [:show]
  get 'soya', to: 'portfolios#soya'
  get 'cheese', to: 'portfolios#cheese'
  get 'home', to: 'portfolios#home'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  root to: "portfolios#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
