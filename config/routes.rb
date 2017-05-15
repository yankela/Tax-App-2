Rails.application.routes.draw do
  resources :receipts
  resources :expense_categories
  root 'users#home'

  resources :sessions, only: [:create, :new, :destroy]
  resource :users
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  # get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
