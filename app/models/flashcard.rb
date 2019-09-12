class Flashcard < ApplicationRecord
  validates_presence_of :question, :answer

  belongs_to :deck

  has_many :users, through: :saved_flashcards
end