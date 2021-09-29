# frozen_string_literal: true

require 'rails_helper'

describe RoadTrip, :vcr do
  before(:each) do
    @params = { origin: 'denver,co', destination: 'pueblo,co' }
    @time = Time.now
    @road_trip = RoadTrip.new(@time, @params)
  end

  it 'exists' do
    expect(@road_trip).to be_a(RoadTrip)
  end

  it 'attributes' do
    expect(@road_trip.id).to eq(nil)
    expect(@road_trip.start_city).to eq(@params[:origin])
    expect(@road_trip.end_city).to eq(@params[:destination])
    expect(@road_trip.travel_time).to eq(@time)
    expect(@road_trip.weather).to eq(nil)
  end

  it 'add_weather' do
    forecast = double

    @road_trip.add_weather(forecast)

    expect(@road_trip.weather).to eq(forecast)
  end
end
