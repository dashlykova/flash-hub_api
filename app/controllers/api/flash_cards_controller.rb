class Api::FlashCardsController < ApplicationController
  MAX_AMOUNT_OF_FLASH_CARDS_TO_DISPLAY = 10

  def index
    flash_cards = FlashCard.first(MAX_AMOUNT_OF_FLASH_CARDS_TO_DISPLAY)
    render json: flash_cards
  end
end