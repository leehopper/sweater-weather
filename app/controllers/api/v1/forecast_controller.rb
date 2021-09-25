# frozen_string_literal: true

class Api::V1::ForecastController < ApplicationController
  def index
    ForecastFacade.get_forecast(location_param[:location])
  end

  private
  def location_param
    params.permit(:location)
  end
end
