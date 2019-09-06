class Api::FlashcardsController < ApplicationController
  MAX_AMOUNT_OF_FLASH_CARDS_TO_DISPLAY = 10

  def index
    flashcards = Flashcard.first(MAX_AMOUNT_OF_FLASH_CARDS_TO_DISPLAY)
    render json: flashcards
  end

  def update
    flashcard = Flashcard.find_by(id: params[:id])
    if params[:status]
      begin 
        flashcard.update_attribute(:status, params[:status])
        render json: { message: 'Successfully added status' }
      rescue
        render_update_error('Incorrect status')
      end
    else
      render_update_error('No status was sent')
    end  
  end

  private

  def render_update_error(error_message)
    render json: { error: error_message }, status: 422
  end
end