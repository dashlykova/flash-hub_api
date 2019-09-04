RSpec.describe Api::FlashCardsController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe "GET /api/flash_cards" do

    before do
      11.times do      
        FactoryBot.create(:flash_card)
      end

    end

    it "returns a collection of max 10 flash cards" do
      get "/api/flash_cards", headers: headers
      expect(json_response.count).to eq 10
    end

    it "returns 200 response" do
      get "/api/flash_cards", headers: headers
      expect(response.status).to eq 200
    end
  end
end
