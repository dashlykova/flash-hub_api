RSpec.describe Api::SavedFlashcardsController, type: :request do
  let(:user) { create(:user) }
  let!(:credentials) { user.create_new_auth_token }
  let!(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }
  let!(:bad_headers) { { HTTP_ACCEPT: 'application/json' } }
  let(:flashcard) { create(:flashcard) }


  describe "POST /api/saved_flashcards" do

    describe 'sucessfully creates' do
      before do        
        post "/api/saved_flashcards", 
        params: {
          status: 'red',
          flashcard_id: flashcard.id
        },
        headers: headers
      end
  
      it "returns 200 response" do
        expect(response.status).to eq 200
      end
  
      it "returns success message" do
        expect(json_response['message']).to eq 'Successfully saved the flashcard'
      end
    end

    describe 'no params' do
      before do
        post "/api/saved_flashcards", 
        headers: headers
      end
  
      it "returns 400 response" do
        expect(response.status).to eq 400
      end
  
      it "returns error message" do        
        expect(json_response['error']).to eq "Flashcard can't be blank and Flashcard must exist"
      end
    end

    describe 'non authenticated user tries to save flashcard' do
      before do
        post "/api/saved_flashcards", 
        params: {
          status: 'yellow',
          flashcard_id: flashcard.id
        },
        headers: bad_headers
      end
  
      it "returns 401 response" do
        expect(response.status).to eq 401
      end
  
      it "returns error message" do    
        expect(json_response['errors'][0]).to eq 'You need to sign in or sign up before continuing.'
      end
    end
  end
end