FactoryBot.define do
  factory :flashcard do
    answer { "MyAnswer" }
    question { "MyQuestion" }
    association :deck
  end
end
