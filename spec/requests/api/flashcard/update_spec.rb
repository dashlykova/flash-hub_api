RSpec.describe Api::FlashcardsController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }
  let(:flashcard) { create(:flashcard) }
  describe "PUT /api/flashcards/:id" do
    
    describe 'sucessfully updates' do
      before do
        put "/api/flashcards/"+"#{flashcard.id}", 
        params: {
          status: 'green'
        },
        headers: headers
      end
  
      it "returns 200 response" do
        expect(response.status).to eq 200
      end
  
      it "sets status for the correct flashcard" do
        flashcard.reload
        expect(flashcard.status).to eq 'green'
      end
    end

    describe 'no status param' do
      before do
        put "/api/flashcards/"+"#{flashcard.id}", 
        headers: headers
      end
  
      it "returns 422 response" do
        expect(response.status).to eq 422
      end
  
      it "returns error message" do        
        expect(json_response['error']).to eq 'No status was sent'
      end
    end

    describe 'wrong status param' do
      before do
        put "/api/flashcards/"+"#{flashcard.id}", 
        params: {
          status: 'purple'
        },
        headers: headers
      end
  
      it "returns 422 response" do
        expect(response.status).to eq 422
      end
  
      it "returns error message" do          
        expect(json_response['error']).to eq 'Incorrect status'
      end

    end
  end
end