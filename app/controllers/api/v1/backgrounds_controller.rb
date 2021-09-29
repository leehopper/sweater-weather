# frozen_string_literal: true

module Api
  module V1
    class BackgroundsController < ApplicationController
      def index
        if location_param[:location]
          bg = BackgroundsFacade.find_image(location_param[:location])
          render json: ImageSerializer.new(bg)
        else
          render_missing_param
        end
      end

      private

      def location_param
        params.permit(:location)
      end
    end
  end
end
