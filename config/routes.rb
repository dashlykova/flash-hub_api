Rails.application.routes.draw do
  namespace :api do
    resources :flash_cards, only: [:index]
  end
end
