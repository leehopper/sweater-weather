require 'rails_helper'

describe 'users' do
  describe 'post request' do
    it 'creates a user' do
      post_params = ({
        email: "lee_sweater_weather@gmail.com",
        password: 'password1',
        password_confirmation: 'password1'
      })

      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: JSON.generate(post_params)

      created_user = User.last

      expect(response).to be_successful

      user = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(user).to have_key(:id)
      expect(user[:id]).to eq(created_user.id.to_s)
      expect(user).to have_key(:type)
      expect(user[:type]).to eq('users')
      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes][:email]).to eq(created_user.email)
      expect(user[:attributes]).to have_key(:api_key)
      expect(user[:attributes][:api_key]).to eq(created_user.api_keys.first.token)
    end
  end
end
