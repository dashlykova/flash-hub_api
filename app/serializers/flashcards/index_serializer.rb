class Flashcards::IndexSerializer < ActiveModel::Serializer
  attributes :question, :answer, :status, :id
end