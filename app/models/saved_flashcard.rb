class SavedFlashcard < ApplicationRecord
  validates_presence_of :user, :flashcard

  enum status: [:no_status, :green, :yellow, :red]

  belongs_to :user
  belongs_to :flashcard
end