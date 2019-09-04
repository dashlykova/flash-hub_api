class Api::FlashCardsController < ApplicationController
  def index
    flash_cards = FlashCard.all
    render json: flash_cards
  end
end