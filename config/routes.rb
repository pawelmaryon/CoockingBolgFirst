Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  resources :portfolios, except: [:show]
  get 'soya', to: 'portfolios#soya'
  get 'cheese', to: 'portfolios#cheese'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  root to: "portfolios#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
