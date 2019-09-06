class Flashcard < ApplicationRecord
  validates_presence_of :question, :answer

  enum status: [:green, :yellow, :red]
end