Rails.application.routes.draw do

  resources :expense_categories do
      resources :receipts
  end
  resources :receipts

  root 'users#home'

  resources :sessions, only: [:create, :new, :destroy]
  resource :users
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  get '/receiptslist', to: 'expense_categories#receiptslist'
get '/search', to: 'expense_categories#search'
  get 'current_user' => "users#logged_in_player"
  # get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
