# frozen_string_literal: true

class RoadTripFacade
  def self.new_roadtrip(rt_params)
    json = MapQuestService.get_route(rt_params)
    rt = RoadTrip.new(json, rt_params)
    geo_json = MapQuestService.get_coordinates(rt.end_city)
    geo = Location.new(geo_json)
    weather_json = OpenWeatherService.get_weather(geo)
    forecast = Forecast.new(weather_json)
    forecast.generate_hourly_weather(weather_json)
    rt.add_weather(forecast)
    rt
  end
end
