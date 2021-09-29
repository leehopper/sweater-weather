# frozen_string_literal: true

module Api
  module V1
    class RoadTripController < ApplicationController
      def create
        if ApiKey.find_by(token: key_param[:api_key])
          rt = RoadTripFacade.new_roadtrip(rt_params)
          render json: RoadtripSerializer.new(rt)
        else
          render_invalid_key
        end
      end

      private

      def key_param
        params.require(:road_trip).permit(:api_key)
      end

      def rt_params
        params.require(:road_trip).permit(:origin, :destination)
      end
    end
  end
end
