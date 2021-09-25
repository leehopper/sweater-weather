# frozen_string_literal: true

class ForecastFacade
  def self.get_forecast(location)
    MapQuestService.get_coordinates(location)
  end
end
