# frozen_string_literal: true

class RoadTripFacade
  def self.new_roadtrip(rt_params)
    json = MapQuestService.get_coordinates(rt_params[:destination])
    geo = Location.new(json)
    json = OpenWeatherService.get_weather(geo)
    forecast = Forecast.new(json)
    forecast.generate_daily_weather(json)
    forecast.generate_hourly_weather(json)
    forecast
  end
end
