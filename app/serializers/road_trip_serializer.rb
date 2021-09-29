# frozen_string_literal: true

class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start_city, :end_city

  attributes :travel_time do |object|
    object.travel_time.strftime('%I hours, %M minutes')
  end

  attributes :weather_at_eta do |object|
    {
      temperature: object.weather.destination_temp(object.travel_time),
      conditions: object.weather.destination_conditions(object.travel_time)
    }
  end
end
