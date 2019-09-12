Rails.application.routes.draw do
  namespace :api do
    resources :decks, only: [:index]
    resources :saved_flashcards, only: [:index, :create]
    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  end
end
