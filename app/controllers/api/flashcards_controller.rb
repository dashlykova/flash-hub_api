class Api::FlashcardsController < ApplicationController
  MAX_AMOUNT_OF_FLASH_CARDS_TO_DISPLAY = 10

  def index
    flashcards = Flashcard.first(MAX_AMOUNT_OF_FLASH_CARDS_TO_DISPLAY)
    render json: flashcards
  end

  def update
    flashcard = Flashcard.find_by(id: params[:id])
    binding.pry
    
    flashcard.update_attributes(flashcard_params)
    
    
  end

  private

  def flashcard_params
    params.permit(:status)
  end
end