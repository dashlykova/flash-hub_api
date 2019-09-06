FactoryBot.define do
  factory :flashcard do
    answer { "MyAnswer" }
    question { "MyQuestion" }
    status { 0 }
    association :deck
  end
end
