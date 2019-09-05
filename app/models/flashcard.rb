class Flashcard < ApplicationRecord
  validates_presence_of :question, :answer
end