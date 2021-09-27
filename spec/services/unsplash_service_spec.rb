# frozen_string_literal: true

require 'rails_helper'

describe 'UnsplashServiceSpec', :vcr do
  it 'returns symbolized json from unsplash api' do
    response = UnsplashService.get_image('denver,co')

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
  end
end
