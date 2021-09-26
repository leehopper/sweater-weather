require 'rails_helper'

describe 'OpenWeatherServiceSpec', :vcr do
  it 'returns symbolized json from open weather api' do
    location = double()
    allow(location).to receive(:lat).and_return(39.738453)
    allow(location).to receive(:long).and_return(-104.984853)

    response = OpenWeatherService.get_weather(location)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:current)
    expect(response).to have_key(:hourly)
    expect(response).to have_key(:daily)
  end
end
