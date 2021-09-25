class MapQuestService < ApiService
  def self.get_coordinates(location)
    response = Faraday.new('http://www.mapquestapi.com/geocoding/v1/address').get do |f|
      f.params['key'] = ENV['map_quest_key']
      f.params['location'] = location
    end

    ApiService.get_json(response)
  end
end
