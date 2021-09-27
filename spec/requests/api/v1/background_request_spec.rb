# frozen_string_literal: true

require 'rails_helper'

describe 'Background API', :vcr do
  describe 'return background image' do
    it 'returns json given city param' do
      get '/api/v1/backgrounds?location=portland,or'

      expect(response).to be_successful

      bg = JSON.parse(response.body, symbolize_names: true)[:data]

    end
  end
end
