# frozen_string_literal: true

module Api
  module V1
    class ForecastController < ApplicationController
      def index
        forecast = ForecastFacade.get_forecast(location_param[:location])
        render json: ForecastSerializer.new(forecast)
      end

      private

      def location_param
        params.permit(:location)
      end
    end
  end
end
