require 'rails_helper'

describe Forecast, :vcr do
  before(:each) do
    location = double()
    allow(location).to receive(:lat).and_return(39.738453)
    allow(location).to receive(:long).and_return(-104.984853)

    @json = OpenWeatherService.get_weather(location)
    @forecast = Forecast.new(@json)
  end

  it 'exists' do
    expect(@forecast).to be_a(Forecast)
  end

  it 'attributes' do
    expect(@forecast.id).to eq(nil)
    expect(@forecast.current_weather).to be_a(CurrentWeather)
    expect(@forecast.daily_weather).to eq([])
    expect(@forecast.hourly_weather).to eq([])
  end

  it '.generate_daily_weather' do
    @forecast.generate_daily_weather(@json)

    expect(@forecast.daily_weather.count).to eq(5)

    @forecast.daily_weather.each do |daily|
      expect(daily).to be_a(DailyWeather)
    end
  end
end
