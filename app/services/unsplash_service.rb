# frozen_string_literal: true

class UnsplashService < ApiService
  def self.get_image(location)
    response = Faraday.new('https://api.unsplash.com/search/photos').get do |f|
      f.params['client_id'] = ENV['unsplash_access_key']
      f.params['query'] = location
      f.params['per_page'] = 1
    end

    ApiService.get_json(response)
  end
end
