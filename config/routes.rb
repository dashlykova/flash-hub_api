Rails.application.routes.draw do
  namespace :api do
    resources :flashcards, only: [:update]
    resources :decks, only: [:index]
  end
end
