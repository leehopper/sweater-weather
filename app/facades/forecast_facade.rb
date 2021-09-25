# frozen_string_literal: true

class ForecastFacade
  def self.get_forecast(location)
    json = MapQuestService.get_coordinates(location)
    geo = Location.new(json)

    binding.pry
  end
end
