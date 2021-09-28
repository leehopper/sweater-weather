# frozen_string_literal: true

class ApplicationController < ActionController::API
  # protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
  # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def invalid_record
    render json: {
        errors: [
          {
            status: 401,
            title: 'Invalid Attribute',
            message: 'Invalid user info input'
          }
        ]
      }.to_json, status: 401
  end

  def render_bad_password_match
    render json: {
        errors: [
          {
            status: 401,
            title: 'Invalid Password',
            message: 'Passwords do not match.'
          }
        ]
      }.to_json, status: 401
  end

  # def render_not_found_response(exception)
  #   render json: { error: exception.message }, status: :not_found
  # end
end
