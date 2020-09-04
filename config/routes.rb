Rails.application.routes.draw do
  resources :blogs
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
