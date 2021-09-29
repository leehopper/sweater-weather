# frozen_string_literal: true

require 'rails_helper'

describe 'Background API', :vcr do
  describe 'return background image' do
    it 'returns json given city param' do
      get '/api/v1/backgrounds?location=portland,or'

      expect(response).to be_successful

      bg = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(bg).to have_key(:id)
      expect(bg[:id]).to eq(nil)
      expect(bg).to have_key(:type)
      expect(bg[:type]).to eq('image')

      attributes = bg[:attributes]

      expect(attributes).to have_key(:location)
      expect(attributes[:location]).to be_a(String)
      expect(attributes).to have_key(:image_url)
      expect(attributes[:image_url]).to be_a(String)
      expect(attributes).to have_key(:source)
      expect(attributes[:source]).to eq('unsplash.com')
      expect(attributes).to have_key(:photographer)
      expect(attributes[:photographer]).to be_a(String)
      expect(attributes).to have_key(:photographer_profile)
      expect(attributes[:photographer_profile]).to be_a(String)
    end
  end

  describe 'sad path' do
    it 'returns error with missing param' do
      get '/api/v1/backgrounds'

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error[:errors][0][:status]).to eq(401)
      expect(error[:errors][0][:title]).to eq('Invalid Request')
      expect(error[:errors][0][:message]).to eq('Missing parameter')
    end
  end
end
