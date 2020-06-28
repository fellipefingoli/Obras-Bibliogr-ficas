Rails.application.routes.draw do
  resources :authors, only: [:index]
  post 'authors/create_bulk', to: 'authors#create_bulk', as: 'authors_create_bulk'
end
