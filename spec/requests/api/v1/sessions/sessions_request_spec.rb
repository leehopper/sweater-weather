# frozen_string_literal: true

require 'rails_helper'

describe 'sessions' do
  describe 'post request happy path' do
    it 'finds a user with email and password if they exist' do
      user = create(:user, password: 'password1')
      user.api_keys.create(token: SecureRandom.hex)

      post_params = {
        email: user.email,
        password: 'password1',
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(post_params)

      expect(response).to be_successful

      session = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(session).to have_key(:id)
      expect(session[:id]).to eq(user.id.to_s)
      expect(session).to have_key(:type)
      expect(session[:type]).to eq('users')
      expect(session[:attributes]).to have_key(:email)
      expect(session[:attributes][:email]).to eq(user.email)
      expect(session[:attributes]).to have_key(:api_key)
      expect(session[:attributes][:api_key]).to eq(user.api_keys.first.token)

      expect(session[:attributes]).to_not have_key(:password)
    end
  end

  describe 'post request sad path' do
    it 'returns error for invalid password' do
      user = create(:user, password: 'password1')
      user.api_keys.create(token: SecureRandom.hex)

      post_params = {
        email: user.email,
        password: 'wrong_password',
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(post_params)

      expect(response).to_not be_successful

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error[:errors][0][:status]).to eq(403)
      expect(error[:errors][0][:title]).to eq('Invalid Credentials')
      expect(error[:errors][0][:message]).to eq('Email or password incorrect.')
    end

    it 'returns error for invalid email' do
      user = create(:user, password: 'password1')
      user.api_keys.create(token: SecureRandom.hex)

      post_params = {
        email: 'bad_email@email.com',
        password: 'password1',
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(post_params)

      expect(response).to_not be_successful

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error[:errors][0][:status]).to eq(403)
      expect(error[:errors][0][:title]).to eq('Invalid Credentials')
      expect(error[:errors][0][:message]).to eq('Email or password incorrect.')
    end
  end
end
