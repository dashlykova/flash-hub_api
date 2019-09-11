class Api::SavedFlashcardsController < ApplicationController
  before_action :authenticate_api_user!

  def index
    saved_flashcards = SavedFlashcard.where(user: current_api_user, status: params[:status])
    render json: saved_flashcards, each_serializer: SavedFlashcards::IndexSerializer  
  end
end