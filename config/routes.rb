Rails.application.routes.draw do
  resources :receipts
  resources :expense_categories
  root 'users#new'

  resource :sessions
  resource :users
  # get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
