require 'rails_helper'

RSpec.describe Deck, type: :model do
  describe "DB columns" do
    it { is_expected.to have_db_column :category }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :category }
  end

  describe "Factory" do
    it "should have valid factory" do
      expect(create(:flashcard)).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many :flashcards }
  end
end
