# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: user_params[:email])
        if user.authenticate(user_params[:password])
          render json: UsersSerializer.new(user)
        else
          render_invalid_password
        end
      end

      private
      def user_params
        params.permit(:email, :password)
      end
    end
  end
end
