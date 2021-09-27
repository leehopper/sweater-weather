# frozen_string_literal: true

module Api
  module V1
    class BackgroundsController < ApplicationController
      def index
        bg = BackgroundsFacade.find_image(location_param[:location])
        render json: ImageSerializer.new(bg)
      end

      private
      def location_param
        params.permit(:location)
      end
    end
  end
end
