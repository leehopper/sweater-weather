# frozen_string_literal: true

require 'rails_helper'

describe 'Forecast API', :vcr do
  describe 'return weather for a city' do
    it 'returns json given a city' do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to be_successful

      forecast = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(forecast[:id]).to eq(nil)
      expect(forecast[:type]).to eq('forecast')

      forecast = forecast[:attributes]

      expect(forecast[:current_weather]).to have_key(:datetime)
      expect(forecast[:current_weather][:datetime]).to be_a(String)
      expect(forecast[:current_weather]).to have_key(:sunrise)
      expect(forecast[:current_weather][:sunrise]).to be_a(String)
      expect(forecast[:current_weather]).to have_key(:sunset)
      expect(forecast[:current_weather][:sunset]).to be_a(String)
      expect(forecast[:current_weather]).to have_key(:temperature)
      expect(forecast[:current_weather][:temperature]).to be_a(Float)
      expect(forecast[:current_weather]).to have_key(:feels_like)
      expect(forecast[:current_weather][:feels_like]).to be_a(Float)
      expect(forecast[:current_weather]).to have_key(:humidity)
      expect(forecast[:current_weather][:humidity]).to be_a(Integer)
      expect(forecast[:current_weather]).to have_key(:uvi)
      expect(forecast[:current_weather][:uvi]).to be_a(Float)
      expect(forecast[:current_weather]).to have_key(:visibility)
      expect(forecast[:current_weather][:visibility]).to be_a(Integer)
      expect(forecast[:current_weather]).to have_key(:conditions)
      expect(forecast[:current_weather][:conditions]).to be_a(String)
      expect(forecast[:current_weather]).to have_key(:icon)
      expect(forecast[:current_weather][:icon]).to be_a(String)

      expect(forecast[:current_weather]).to_not have_key(:pressure)
      expect(forecast[:current_weather]).to_not have_key(:dew_point)
      expect(forecast[:current_weather]).to_not have_key(:clouds)
      expect(forecast[:current_weather]).to_not have_key(:wind_speed)
      expect(forecast[:current_weather]).to_not have_key(:wind_deg)
      expect(forecast[:current_weather]).to_not have_key(:wind_gust)
      expect(forecast[:current_weather]).to_not have_key(:main)

      expect(forecast[:daily_weather].count).to eq(5)
      forecast[:daily_weather].each do |date|
        expect(date).to have_key(:date)
        expect(date[:date]).to be_a(String)
        expect(date).to have_key(:sunrise)
        expect(date[:sunrise]).to be_a(String)
        expect(date).to have_key(:sunset)
        expect(date[:sunset]).to be_a(String)
        expect(date).to have_key(:max_temp)
        expect(date[:max_temp]).to be_a(Float)
        expect(date).to have_key(:min_temp)
        expect(date[:min_temp]).to be_a(Float)
        expect(date).to have_key(:conditions)
        expect(date[:conditions]).to be_a(String)
        expect(date).to have_key(:icon)
        expect(date[:icon]).to be_a(String)

        expect(date).to_not have_key(:moonrise)
        expect(date).to_not have_key(:moonset)
        expect(date).to_not have_key(:moon_phase)
        expect(date).to_not have_key(:feels_like)
        expect(date).to_not have_key(:pressure)
        expect(date).to_not have_key(:humidity)
        expect(date).to_not have_key(:dew_point)
        expect(date).to_not have_key(:wind_speed)
        expect(date).to_not have_key(:wind_deg)
        expect(date).to_not have_key(:wind_gust)
        expect(date).to_not have_key(:pop)
        expect(date).to_not have_key(:clouds)
      end

      expect(forecast[:hourly_weather].count).to eq(8)
      forecast[:hourly_weather].each do |hour|
        expect(hour).to have_key(:time)
        expect(hour[:time]).to be_a(String)
        expect(hour).to have_key(:temperature)
        expect(hour[:temperature]).to be_a(Float)
        expect(hour).to have_key(:conditions)
        expect(hour[:conditions]).to be_a(String)
        expect(hour).to have_key(:icon)
        expect(hour[:icon]).to be_a(String)

        expect(hour).to_not have_key(:feels_like)
        expect(hour).to_not have_key(:pressure)
        expect(hour).to_not have_key(:humidity)
        expect(hour).to_not have_key(:dew_point)
        expect(hour).to_not have_key(:uvi)
        expect(hour).to_not have_key(:clouds)
        expect(hour).to_not have_key(:visibility)
        expect(hour).to_not have_key(:wind_speed)
        expect(hour).to_not have_key(:wind_deg)
        expect(hour).to_not have_key(:wind_gust)
        expect(hour).to_not have_key(:pop)
      end
    end
  end
end
