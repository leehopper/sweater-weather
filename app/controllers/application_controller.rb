# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

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

  def render_missing_param
    render json: {
      errors: [
        {
          status: 401,
          title: 'Invalid Request',
          message: 'Missing parameter'
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

  def render_invalid_credentials
    render json: {
      errors: [
        {
          status: 403,
          title: 'Invalid Credentials',
          message: 'Email or password incorrect.'
        }
      ]
    }.to_json, status: 403
  end

  def render_invalid_key
    render json: {
      errors: [
        {
          status: 401,
          title: 'Unauthorized',
          message: 'Invalid api key'
        }
      ]
    }.to_json, status: 401
  end
end
