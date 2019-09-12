class CreateSavedFlashcards < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_flashcards do |t|
      t.belongs_to :user
      t.belongs_to :flashcard
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
