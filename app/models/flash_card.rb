class FlashCard < ApplicationRecord
  validates_presence_of :question, :answer
end