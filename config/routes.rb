Rails.application.routes.draw do
  namespace :api do
    resources :flashcards, only: [:update]
    resources :decks, only: [:index]
    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  end
end
