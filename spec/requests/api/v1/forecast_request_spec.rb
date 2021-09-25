# frozen_string_literal: true

require 'rails_helper'

describe 'Forecast API' do
  describe 'return weather for a city' do
    it 'returns json given a city' do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to be_successful

      returned = JSON.parse(response.body, symbolize_names: true)

    end
  end
end
