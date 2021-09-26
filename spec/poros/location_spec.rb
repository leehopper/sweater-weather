# frozen_string_literal: true

require 'rails_helper'

describe Location, :vcr do
  before(:each) do
    json = MapQuestService.get_coordinates('Denver,co')
    @location = Location.new(json)
  end

  it 'exists' do
    expect(@location).to be_a(Location)
  end

  it 'attributes' do
    expect(@location.lat).to eq(39.738453)
    expect(@location.long).to eq(-104.984853)
  end
end
