# frozen_string_literal: true

class ForecastFacade
  def self.get_forecast(location)
    json = MapQuestService.get_coordinates(location)
    geo = Location.new(json)
    json = OpenWeatherService.get_weather(geo)
    forecast = Forecast.new(json)
    forecast.generate_daily_weather(json)
    forecast.generate_hourly_weather(json, 8)
    forecast
  end
end
