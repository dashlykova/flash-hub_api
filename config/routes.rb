Rails.application.routes.draw do
  namespace :api do
    resources :flashcards, only: [:index]
  end
end
