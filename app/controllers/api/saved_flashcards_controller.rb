class Api::SavedFlashcardsController < ApplicationController
  before_action :authenticate_api_user!

  def index
    begin
      if params[:status] == 'yellow'
        saved_flashcards = SavedFlashcard.where(user: current_api_user, status: 'yellow').or(SavedFlashcard.where(user: current_api_user, status: 'red'))
      else
        saved_flashcards = SavedFlashcard.where(user: current_api_user, status: params[:status])        
      end
      
      if saved_flashcards.empty?
        render_saved_flashcard_error('You have no saved flashcards')

      else
        render json: saved_flashcards, each_serializer: SavedFlashcards::IndexSerializer
      end

    rescue => error
      render_saved_flashcard_error(error.to_s)      
    end   
  end

  def create    
    saved_flashcard = current_api_user.saved_flashcards.create(saved_flashcard_params)
    
    if saved_flashcard.persisted?
      render json: {message: 'Successfully saved the flashcard'}
    else
      render_saved_flashcard_error(saved_flashcard.errors.full_messages.to_sentence)
    end
    
  end

  private

  def saved_flashcard_params
    params.permit(:status, :flashcard_id)
  end

  def render_saved_flashcard_error(error_message)    
    render json: { error: error_message }, status: 400
  end
end