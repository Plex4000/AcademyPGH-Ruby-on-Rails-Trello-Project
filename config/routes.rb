Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'boards/index'

  resources :boards

  resources :lists

  resources :cards

  root 'boards#index'
end
