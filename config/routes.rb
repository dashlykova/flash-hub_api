Rails.application.routes.draw do
  namespace :api do
    resources :flashcards, only: [:index, :update]
    resources :decks, only: [:index]
  end
end
