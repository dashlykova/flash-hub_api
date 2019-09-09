class Flashcard < ApplicationRecord
  validates_presence_of :question, :answer

  enum status: [:no_status, :green, :yellow, :red]

  belongs_to :deck
end