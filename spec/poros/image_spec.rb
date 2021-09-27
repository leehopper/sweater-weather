# frozen_string_literal: true

require 'rails_helper'

describe Image, :vcr do
  before(:each) do
    @location = 'portland,or'
    json = UnsplashService.get_image(@location)
    @image = Image.new(json[:results][0], @location)
  end

  it 'exists' do
    expect(@image).to be_a(Image)
  end

  it 'attributes' do
    expect(@image.id).to eq(nil)
    expect(@image.location).to eq(@location)
    expect(@image.image_url).to be_a(String)
    expect(@image.source).to eq('unsplash.com')
    expect(@image.photographer).to be_a(String)
    expect(@image.photographer_profile).to be_a(String)
  end
end
