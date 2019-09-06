class Api::DecksController < ApplicationController
  def index
    if params[:category]      
      decks = Deck.where(category: params[:category]).page(params[:page] || 1).per_page(1)
      render json: decks, each_serializer: Decks::IndexSerializer,  meta: meta_attributes(decks)  
    else
      decks = Deck.all.page(params[:page] || 1).per_page(1)
      render json: decks, each_serializer: Decks::IndexSerializer,  meta: meta_attributes(decks)  
    end
    
  end
end