# frozen_string_literal: true

class Api::V1::ForecastController < ApplicationController
  def index
    test = ForecastFacade.get_forecast(location_param[:location])
    binding.pry
  end

  private
  def location_param
    params.permit(:location)
  end
end
