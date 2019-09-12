class SavedFlashcards::IndexSerializer < ActiveModel::Serializer
  attributes :id, :status, :question, :answer

  def question
    object.flashcard.question
  end

  def answer
    object.flashcard.answer
  end
end