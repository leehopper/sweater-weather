# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        if user = User.find_by(email: user_params[:email])
          if user.authenticate(user_params[:password])
            render json: UsersSerializer.new(user)
            return
          end
        end 
        render_invalid_credentials
      end

      private
      def user_params
        params.permit(:email, :password)
      end
    end
  end
end
