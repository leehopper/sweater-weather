# frozen_string_literal: true

require 'rails_helper'

describe 'Book Search API' do
  describe 'return books and weather' do
    it 'returns json given city param' do
      get '/api/v1/book-search?location=denver,co&quantity=5'

      expect(response).to be_successful
    end
  end
end
