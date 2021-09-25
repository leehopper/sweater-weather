# frozen_string_literal: true

class Api::V1::ForecastController < ApplicationController
  def index
    forecast = ForecastFacade.get_forecast(location_param[:location])
    render json: ForecastSerializer.new(forecast)
  end

  private
  def location_param
    params.permit(:location)
  end
end
