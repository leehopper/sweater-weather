# frozen_string_literal: true

require 'rails_helper'

describe BookForecast, :vcr do
  before(:each) do
    location = double
    allow(location).to receive(:lat).and_return(39.738453)
    allow(location).to receive(:long).and_return(-104.984853)

    json = OpenWeatherService.get_weather(location)
    @forecast = BookForecast.new(json)
  end

  it 'exists' do
    expect(@forecast).to be_a(BookForecast)
  end

  it 'attributes' do
    expect(@forecast.summary).to be_a(String)
    expect(@forecast.temperature).to be_a(String)
  end
end
