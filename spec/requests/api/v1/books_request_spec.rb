# frozen_string_literal: true

require 'rails_helper'

describe 'Book Search API', :vcr do
  describe 'return books and weather' do
    it 'returns json given city param' do
      get '/api/v1/book-search?location=denver,co&quantity=5'

      expect(response).to be_successful

      search = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(search[:id]).to eq(nil)
      expect(search[:type]).to eq('books')

      attributes = search[:attributes]

      expect(attributes[:destination]).to eq('denver,co')

      expect(attributes).to have_key(:forecast)
      expect(attributes[:forecast]).to be_a(Hash)
      expect(attributes[:forecast]).to have_key(:summary)
      expect(attributes[:forecast][:summary]).to be_a(String)
      expect(attributes[:forecast]).to have_key(:temperature)
      expect(attributes[:forecast][:temperature]).to be_a(String)
    end
  end
end
