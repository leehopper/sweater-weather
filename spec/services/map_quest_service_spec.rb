require 'rails_helper'

describe 'MapQuestServiceSpec', :vcr do
  it 'returns symbolized json from map quest api' do
    response = MapQuestService.get_coordinates('Denver,co')

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results][0]).to have_key(:locations)
  end
end
