class Flashcards::IndexSerializer < ActiveModel::Serializer  
  attributes :question, :answer, :status, :id, :deck_id
end