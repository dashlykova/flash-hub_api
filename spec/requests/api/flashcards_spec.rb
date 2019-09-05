RSpec.describe Api::FlashcardsController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe "GET /api/flashcards" do

    before do
      11.times do      
        create(:flashcard)
      end
      get "/api/flashcards", headers: headers
    end

    it "returns a deck with maximum 10 flashcards" do
      expect(json_response.count).to eq 10
    end

    it "returns 200 response" do
      expect(response.status).to eq 200
    end
  end
end