# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_library) { FactoryBot.create(:library) }

      before do
        post '/books', params:
                          { book: {
                            isbn: '456124',
                            title: 'Algorithms to Live By: The Computer Science',
                            authors: 'Brian Christian, Tom Griffiths, Thomas L. Griffiths',
                            language: 'English',
                            edition: 'first',
                            subject: 'Computer',
                            library_id: my_library.id
                          } }
      end

      it 'returns the title' do
        expect(response).to have_http_status(:success)
      end

      it 'returns http success' do
        get '/books'
        expect(response.status).to eq(200)
      end
    end
  end

  # describe 'GET /books' do
  #   it 'returns http success' do
  #     get '/books'
  #     expect(response.status).to eq(200)
  #   end
  # end
end
