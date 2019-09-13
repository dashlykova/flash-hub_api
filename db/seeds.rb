# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

SavedFlashcard.destroy_all
Flashcard.destroy_all
Deck.destroy_all
User.destroy_all

user = User.create(email: 'user@mail.com', password: 'password')

js_deck = Deck.create(category: 'javascript')
js_2_deck = Deck.create(category: 'javascript')

ruby_deck = Deck.create(category: 'ruby')
ruby_2_deck = Deck.create(category: 'ruby')

commands_deck = Deck.create(category: 'commands')
commands_2_deck = Deck.create(category: 'commands')


js_flashcards = 10.times do
  question = Faker::Lorem.sentences(number: 1)
  answer = Faker::Lorem.unique

  Flashcard.create(answer: answer, question: question, deck: js_deck)
end

js_2_flashcards = 10.times do
  question = Faker::Lorem.sentences(number: 1)
  answer = Faker::Lorem.unique

  Flashcard.create(answer: answer, question: question, deck: js_2_deck)
end

ruby_flashcards = 10.times do
  question = Faker::Lorem.sentences(number: 1)
  answer = Faker::Lorem.unique

  Flashcard.create(answer: answer, question: question, deck: ruby_deck)
end

ruby_2_flashcards = 10.times do
  question = Faker::Lorem.sentences(number: 1)
  answer = Faker::Lorem.unique

  Flashcard.create(answer: answer, question: question, deck: ruby_2_deck)
end

git_flashcards = 10.times do
  question = Faker::Lorem.sentences(number: 1)
  answer = Faker::Lorem.unique

  Flashcard.create(answer: answer, question: question, deck: commands_deck)
end

git_2_flashcards = 10.times do
  question = Faker::Lorem.sentences(number: 1)
  answer = Faker::Lorem.unique

  Flashcard.create(answer: answer, question: question, deck: commands_2_deck)
end

7.times do |n|
  SavedFlashcard.create(flashcard: Flashcard.all[n], user: user, status: "yellow")
end