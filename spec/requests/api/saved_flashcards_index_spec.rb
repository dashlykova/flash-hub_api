RSpec.describe Api::SavedFlashcardsController, type: :request do
  let!(:user) { create(:user) }
  let!(:credentials) { user.create_new_auth_token }
  let!(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }
  let!(:red_saved_flashcards) { 7.times { create(:saved_flashcard, status: "red", user: user) } }
  let!(:yellow_saved_flashcards) { 10.times { create(:saved_flashcard, status: "yellow", user: user) } }

  describe "GET /api/saved_flashcards" do

    describe 'sucessfully gets users saved flashcards [red ones]' do
      before do        
        get "/api/saved_flashcards", 
        params: {
          status: 'red'
        },
        headers: headers
      end
  
      it "returns 200 response" do        
        expect(response).to have_http_status :ok
      end
  
      it "sets status for the correct flashcard" do        
        expect(json_response['savedFlashcards'].count).to eq 7
      end
    end

    describe 'sucessfully gets users saved flashcards [red & yellow ones]' do
      before do        
        get "/api/saved_flashcards", 
        params: {
          status: 'yellow'
        },
        headers: headers
      end
  
      it "returns 200 response" do
        expect(response).to have_http_status :ok
      end
  
      it "sets status for the correct flashcard" do
        expect(json_response['savedFlashcards'].count).to eq 17
      end
    end

    describe 'unsuccessfull if no params are sent' do
      before do        
        get "/api/saved_flashcards",
        headers: headers
      end
  
      it "returns 400 response" do
        expect(response.status).to eq 400
      end
  
      it "returns error message" do
        expect(json_response['error']).to eq 'You have no saved flashcards'
      end
    end
  end
end