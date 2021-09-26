require 'rails_helper'

describe 'ApiServiceSpec', :vcr do
  it 'returns parsed json with symbolized names' do
    response = Faraday.new('http://www.mapquestapi.com/geocoding/v1/address').get do |f|
      f.params['key'] = ENV['map_quest_key']
      f.params['location'] = 'Denver,co'
    end

    expected = ApiService.get_json(response)

    expect(expected).to be_a(Hash)
    expect(expected).to have_key(:results)
    expect(expected[:results][0]).to have_key(:locations)
  end
end
