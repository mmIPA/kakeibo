Rails.application.routes.draw do
  root to: 'home#index' 
  resources :expenses, only: [:index, :new, :create]
end
