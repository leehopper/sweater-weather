# frozen_string_literal: true

class ForecastFacade
  def self.get_forecast(location)
    test = MapQuestService.get_coordinates(location)
    binding.pry 
  end
end
