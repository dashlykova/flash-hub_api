class Decks::IndexSerializer < ActiveModel::Serializer
  attributes :category
  has_many :flashcards, each_serializer: Flashcards::IndexSerializer
end