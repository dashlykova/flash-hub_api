class Decks::IndexSerializer < ActiveModel::Serializer
  attributes :category, :flashcards

  def flashcards
    object.flashcards.each.map do |flashcard|
      Flashcards::IndexSerializer.new(flashcard)
    end
  end
end