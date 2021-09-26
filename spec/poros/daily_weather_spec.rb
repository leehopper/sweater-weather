# frozen_string_literal: true

require 'rails_helper'

describe DailyWeather, :vcr do
  before(:each) do
    location = double
    allow(location).to receive(:lat).and_return(39.738453)
    allow(location).to receive(:long).and_return(-104.984853)

    json = OpenWeatherService.get_weather(location)
    @daily_weather = DailyWeather.new(json[:daily].first)
  end

  it 'exists' do
    expect(@daily_weather).to be_a(DailyWeather)
  end

  it 'attributes' do
    expect(@daily_weather.date).to be_a(String)
    expect(@daily_weather.sunrise).to be_a(Time)
    expect(@daily_weather.sunset).to be_a(Time)
    expect(@daily_weather.max_temp).to be_a(Float)
    expect(@daily_weather.min_temp).to be_a(Float)
    expect(@daily_weather.conditions).to be_a(String)
    expect(@daily_weather.icon).to be_a(String)
  end
end
