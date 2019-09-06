class Deck < ApplicationRecord
  validates_presence_of :category

  has_many :flashcards
end
