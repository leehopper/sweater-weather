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
      expect(attributes[:forecast]).to_not have_key(:datetime)
      expect(attributes[:forecast]).to_not have_key(:sunrise)
      expect(attributes[:forecast]).to_not have_key(:sunset)
      expect(attributes[:forecast]).to_not have_key(:feels_like)
      expect(attributes[:forecast]).to_not have_key(:humidity)
      expect(attributes[:forecast]).to_not have_key(:uvi)
      expect(attributes[:forecast]).to_not have_key(:visibility)
      expect(attributes[:forecast]).to_not have_key(:conditions)
      expect(attributes[:forecast]).to_not have_key(:icon)

      expect(attributes).to have_key(:books)
      expect(attributes[:books].count).to eq(5)

      attributes[:books].each do |book|
        expect(book).to have_key(:isbn)
        expect(book[:isbn]).to be_a(Array)
        expect(book[:isbn][0]).to be_a(String)
        expect(book).to have_key(:title)
        expect(book[:title]).to be_a(String)
        expect(book).to have_key(:publisher)
        expect(book[:publisher]).to be_a(Array)
        expect(book[:publisher][0]).to be_a(String)

        expect(book).to_not have_key(:text)
        expect(book).to_not have_key(:seed)
        expect(book).to_not have_key(:text)
        expect(book).to_not have_key(:edition_count)
        expect(book).to_not have_key(:publish_date)
        expect(book).to_not have_key(:author_name)
      end
    end
  end

  describe 'sad path' do
    it 'returns error for quanity less than 1' do
      get '/api/v1/book-search?location=denver,co&quantity=-5'

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error[:status]).to eq('error')
      expect(error[:code]).to eq(400)
      expect(error[:message]).to eq('quantity must be greater than 0')
    end
  end
end
