# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        if matching_password?
          user = User.create!(user_params)
          user.api_keys.create(token: SecureRandom.hex)
          render json: UsersSerializer.new(user)
        else
          render_bad_password_match
        end
      end

      private

      def matching_password?
        params[:password] == params[:password_confirmation]
      end

      def user_params
        params.permit(:email, :password)
      end
    end
  end
end
