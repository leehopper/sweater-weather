# frozen_string_literal: true

require 'rails_helper'

describe 'MapQuestServiceSpec', :vcr do
  describe '.get_coordinates' do
    it 'returns symbolized json from map quest api' do
      response = MapQuestService.get_coordinates('Denver,co')

      expect(response).to be_a(Hash)
      expect(response).to have_key(:results)
      expect(response[:results][0]).to have_key(:locations)
    end
  end

  describe '.get_route' do
    it 'returns symbolized json from map quest api' do
      params = { origin: 'denver,co', destination: 'pueblo,co' }
      response = MapQuestService.get_route(params)

      expect(response).to be_a(Hash)
      expect(response).to have_key(:route)
    end
  end
end
