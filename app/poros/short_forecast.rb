# frozen_string_literal: true

class ShortForecast
  attr_reader :summary, :temperature

  def initialize(json)
    @summary = json[:current][:weather][0][:description]
    @temperature = "#{json[:current][:temp].round(0)} F"
  end
end
