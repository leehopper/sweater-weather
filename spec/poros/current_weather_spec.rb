require 'rails_helper'

describe CurrentWeather, :vcr do
  before(:each) do
    location = double()
    allow(location).to receive(:lat).and_return(39.738453)
    allow(location).to receive(:long).and_return(-104.984853)

    json = OpenWeatherService.get_weather(location)
    @current_weather = CurrentWeather.new(json[:current])
  end

  it 'exists' do
    expect(@current_weather).to be_a(CurrentWeather)
  end

  it 'attributes' do
    expect(@current_weather.conditions).to be_a(String)
    expect(@current_weather.datetime).to be_a(Time)
    expect(@current_weather.feels_like).to be_a(Float)
    expect(@current_weather.humidity).to be_a(Integer)
    expect(@current_weather.icon).to be_a(String)
    expect(@current_weather.sunrise).to be_a(Time)
    expect(@current_weather.sunset).to be_a(Time)
    expect(@current_weather.temperature).to be_a(Float)
    expect(@current_weather.uvi).to be_a(Integer)
    expect(@current_weather.visibility).to be_a(Integer)
  end
end
