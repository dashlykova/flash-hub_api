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

  private

  def render_saved_flashcard_error(error_message)    
    render json: { error: error_message }, status: 400
  end
end