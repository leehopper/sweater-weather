# frozen_string_literal: true

require 'rails_helper'

describe HourlyWeather, :vcr do
  before(:each) do
    location = double
    allow(location).to receive(:lat).and_return(39.738453)
    allow(location).to receive(:long).and_return(-104.984853)

    json = OpenWeatherService.get_weather(location)
    @hourly_weather = HourlyWeather.new(json[:hourly].first)
  end

  it 'exists' do
    expect(@hourly_weather).to be_a(HourlyWeather)
  end

  it 'attributes' do
    expect(@hourly_weather.time).to be_a(String)
    expect(@hourly_weather.temperature).to be_a(Float)
    expect(@hourly_weather.conditions).to be_a(String)
    expect(@hourly_weather.icon).to be_a(String)
  end
end
