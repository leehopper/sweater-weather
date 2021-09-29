# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: user_params[:email])
        if user&.authenticate(user_params[:password])
          render json: UsersSerializer.new(user)
          return
        end
        render_invalid_credentials
      end

      private

      def user_params
        params.require(:session).permit(:email, :password)
      end
    end
  end
end
