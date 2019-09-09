class Api::DecksController < ApplicationController
  def index
    begin
      if params[:category]      
        @decks = Deck.where(category: params[:category]).page(params[:page] || 1).per_page(1)
      else
        @decks = Deck.all.page(params[:page] || 1).per_page(1)
      end
  
      if @decks.empty?
        render_deck_error('There is no available decks for this page and/or category')
      else
        render_deck_success
      end

    rescue => error
      render_deck_error(error.to_s)
    end
  end

  private 

  def render_deck_error(error_message)
    render json: { error: error_message }, status: 422
  end

  def render_deck_success
    render json: @decks, each_serializer: Decks::IndexSerializer, meta: meta_attributes(@decks)  
  end
end