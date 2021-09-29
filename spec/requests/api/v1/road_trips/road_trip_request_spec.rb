# frozen_string_literal: true

require 'rails_helper'

describe 'road trips', :vcr do
  describe 'post road trip request' do
    it 'returns road trip json' do
      user = create(:user, :with_api_key)

      post_params = {
        origin: 'denver,co',
        destination: 'pueblo,co',
        api_key: user.api_keys.first.token
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(body: post_params)

      expect(response).to be_successful

      rt = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(rt).to have_key(:id)
      expect(rt[:id]).to eq(nil)
      expect(rt).to have_key(:type)
      expect(rt[:type]).to eq('roadtrip')

      
    end
  end
end
