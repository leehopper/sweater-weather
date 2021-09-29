# frozen_string_literal: true

module Api
  module V1
    class RoadTripController < ApplicationController
      def create
        if ApiKey.find_by(token: key_param[:api_key])
          rt = RoadTripFacade.new_roadtrip(rt_params)
          render json: RoadTripSerializer.new(rt)
        else
          #return invalid key json
        end
      end

      private

      def key_param
        params.require(:body).permit(:api_key)
      end

      def rt_params
        params.require(:body).permit(:origin, :destination)
      end
    end
  end
end
