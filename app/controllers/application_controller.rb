# frozen_string_literal: true

class ApplicationController < ActionController::API
  # protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
  # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def invalid_record(exception)
    render json: {
      errors: exception.record.errors.full_messages.map do |m|
        {
          status: 401,
          title: 'Invalid Attribute',
          message: m.to_s
        }
      end
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

  def render_invalid_password
    render json: {
      errors: [
        {
          status: 403,
          title: 'Invalid Password',
          message: 'Password incorrect.'
        }
      ]
    }.to_json, status: 403
  end
end
