class Api::FlashcardsController < ApplicationController
  MAX_AMOUNT_OF_FLASH_CARDS_TO_DISPLAY = 10

  def index
    flashcards = Flashcard.first(MAX_AMOUNT_OF_FLASH_CARDS_TO_DISPLAY)
    render json: flashcards
  end
end