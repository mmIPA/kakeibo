Rails.application.routes.draw do
  root 'expenses#index'
  resources :expenses, only: [:index, :create]
end
