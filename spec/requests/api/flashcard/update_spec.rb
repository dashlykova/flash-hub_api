RSpec.describe Api::FlashcardsController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }
  let(:flashcard) { create(:flashard) }
  describe "PUT /api/flashcards/:id" do

    before do
      put "/api/flashcards/"+"#{flashcard.id}", 
      params: {
        id: flashcard.id,
        status: 'green'
      }
      headers: headers
    end

    it "returns 200 response" do
      expect(response.status).to eq 200
    end

    it "sets status for the correct flashcard" do
      expect(flashcard.status).to eq 'green'
    end
  end
end