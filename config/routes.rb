Rails.application.routes.draw do
  resources :notes, only: [:index, :create]
  root to: 'notes#index'
end
