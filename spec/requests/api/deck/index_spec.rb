RSpec.describe Api::DecksController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }
  
  describe "GET /api/decks" do
    describe 'returns deck without specific category' do
      let!(:decks) { 2.times { create(:deck)}}

      let!(:first_deck_cards) do
        10.times do
          create(:flashcard, deck: Deck.first)
        end
      end

      let!(:last_deck_cards) do
        10.times do
          create(:flashcard, deck: Deck.last)
        end
      end

      describe 'page 1' do
        before do
          get "/api/decks", headers: headers
        end
    
        it "returns a single deck" do        
          expect(json_response['decks'].count).to eq 1
        end
  
        it 'returns 10 flashcards' do
          expect(json_response['decks'].first['flashcards'].count).to eq 10
        end
    
        it "returns 200 response" do
          expect(response.status).to eq 200
        end
    
        it "returns next page number" do        
          expect(json_response['meta']['nextPage']).to eq 2
        end
      end

      describe 'page 2' do
        before do
          get "/api/decks", 
          params: {
            page: 2
          },
          headers: headers
        end

        it "returns 200 response" do
          expect(response.status).to eq 200
        end

        it 'returns correct page number' do
          expect(json_response['meta']['currentPage']).to eq 2
        end

        it "returns that there is no next page" do
          expect(json_response['meta']['nextPage']).to eq nil
        end
      end

      describe 'wrong page number param' do
        before do
          get "/api/decks", 
          params: {
            page: 3
          },
          headers: headers
        end

        it "returns 422 response" do
          expect(response.status).to eq 422
        end

        it 'returns error message' do
          expect(json_response['error']).to eq 'There is no available decks on this page'
        end
      end

      describe 'wrong category param' do
        before do
          get "/api/decks", 
          params: {
            page: 'Wrong category'
          },
          headers: headers
        end

        it "returns 422 response" do
          expect(response.status).to eq 422
        end

        it 'returns error message' do
          expect(json_response['error']).to eq 'Something went wrong'
        end
      end
    end

    describe 'returns deck with specific category' do
      let!(:right_category_deck) { create(:deck, category: 'Javascript')}
      let!(:incorrect_category_deck) { create(:deck, category: 'Ruby')}

      let!(:javascript_deck_cards) do
        10.times do
          create(:flashcard, deck_id: right_category_deck.id)
        end
      end

      before do
        get "/api/decks",
        params: {
          category: 'Javascript'
        },
        headers: headers
      end

      it "returns a single deck" do        
        expect(json_response['decks'].count).to eq 1
      end

      it 'returns 10 flashcards' do
        expect(json_response['decks'].first['flashcards'].count).to eq 10
      end
  
      it "returns 200 response" do
        expect(response.status).to eq 200
      end
  
      it "returns that there is no next page" do
        expect(json_response['meta']['nextPage']).to eq nil
      end

      it "returns deck of correct category" do
        expect(json_response['decks'].first['category']).to eq 'Javascript'
      end
    end
  end
end