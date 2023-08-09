# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Checkout', type: :request do
  describe 'GET /checkout' do
    context 'available for checkout' do
      let(:student) { FactoryBot.create(:student) }
      let(:book) { FactoryBot.create(:book) }

      before { get '/checkout', params: { id: book.id } }

      it 'returns the title' do
        expect(response.status).to eq(200)
      end

      it 'returns book availability message' do
        expect(JSON.parse(response.body)['message']).to eq('Book is available for checkout.')
      end
    end

    context 'not available for checkout' do
      let(:checkout) { FactoryBot.create(:checkout) }

      before { get '/checkout', params: { id: checkout.book_id } }

      it 'returns the title' do
        expect(response.status).to eq(200)
      end

      it 'returns book not available message' do
        expect(JSON.parse(response.body)['message']).to eq('Book is checked out.')
      end
    end
  end
end
