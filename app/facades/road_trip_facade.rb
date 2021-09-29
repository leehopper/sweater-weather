# frozen_string_literal: true

class RoadTripFacade
  def self.new_roadtrip(rt_params)
    json = MapQuestService.get_route(rt_params)
    if json[:route][:routeError][:errorCode] == -400
      rt = RoadTrip.new(json[:route][:formattedTime].to_time, rt_params)
      geo_json = MapQuestService.get_coordinates(rt.end_city)
      geo = Location.new(geo_json)
      weather_json = OpenWeatherService.get_weather(geo)
      forecast = Forecast.new(weather_json)
      forecast.generate_hourly_weather(weather_json)
      rt.add_weather(forecast)
      rt
    else
      RoadTrip.new('impossible', rt_params)
    end
  end
end
