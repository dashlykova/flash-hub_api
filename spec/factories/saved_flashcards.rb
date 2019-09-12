FactoryBot.define do
  factory :saved_flashcard do
    status { 0 } 
    association :user
    association :flashcard
  end
end
