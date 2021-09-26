# frozen_string_literal: true

class Forecast
  attr_reader :id, :current_weather, :daily_weather, :hourly_weather

  def initialize(json)
    @id = nil
    @current_weather = CurrentWeather.new(json[:current])
    @daily_weather = []
    @hourly_weather = []
  end

  def generate_daily_weather(json)
    json[:daily].first(5).each do |day|
      @daily_weather << DailyWeather.new(day)
    end
  end

  def generate_hourly_weather(json)
    json[:hourly].first(8).each do |hour|
      @hourly_weather << HourlyWeather.new(hour)
    end
  end
end
