# frozen_string_literal: true

require 'rails_helper'

describe 'Background API' do
  describe 'return background image' do
    it 'returns json given city param' do
      get '/api/v1/backgrounds?location=denver,co'

      expect(response).to be_successful

      background = JSON.parse(response.body, symbolize_names: true)[:data]
    end
  end
end
