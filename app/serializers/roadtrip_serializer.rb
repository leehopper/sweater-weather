# frozen_string_literal: true

class RoadtripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start_city, :end_city, :travel_time, :weather_at_eta

  attributes :travel_time do |object|
    if object.travel_time == 'impossible'
      object.travel_time
    else
      object.travel_time.strftime('%I hours, %M minutes')
    end
  end

  attributes :weather_at_eta do |object|
    if object.weather.nil?
      ''
    else
      {
        temperature: object.weather.destination_temp(object.travel_time),
        conditions: object.weather.destination_conditions(object.travel_time)
      }
    end
  end
end
