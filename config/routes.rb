Rails.application.routes.draw do
  root to: 'rooms#show'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  delete '/sessions', to: 'sessions#destroy', as: :logout

  mount ActionCable.server => '/cable'
end
