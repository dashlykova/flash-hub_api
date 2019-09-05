require 'rails_helper'

RSpec.describe Flashcard, type: :model do
  describe "DB columns" do
    it { is_expected.to have_db_column :question }
    it { is_expected.to have_db_column :answer }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :question }
    it { is_expected.to validate_presence_of :answer } 
  end

  describe "Factory" do
    it "should have valid factory" do
      expect(FactoryBot.create(:flashcard)).to be_valid
    end
  end
end
