class SavedFlashcards::IndexSerializer < ActiveModel::Serializer
  attributes :flashcard

  def flashcard
    {                                                           
      status: object.status,                                             
      question: object.flashcard.question,                             
      answer: object.flashcard.answer,                                 
      savedFlashCardId: object.id,                                     
      flashcardId: object.flashcard_id                                 
    }
  end
end