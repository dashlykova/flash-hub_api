require 'rails_helper'

RSpec.describe SavedFlashcard, type: :model do
  describe "DB columns" do
    it { is_expected.to have_db_column :user_id }
    it { is_expected.to have_db_column :flashcard_id }
    it { is_expected.to have_db_column :status }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :flashcard } 
  end

  describe "Factory" do
    it "should have valid factory" do
      expect(create(:saved_flashcard)).to be_valid
    end
  end

  describe "Association" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :flashcard }
  end
end
