# frozen_string_literal: true

class MapQuestService < ApiService
  def self.get_coordinates(location)
    response = Faraday.new('http://www.mapquestapi.com/geocoding/v1/address').get do |f|
      f.params['key'] = ENV['map_quest_key']
      f.params['location'] = location
    end

    ApiService.get_json(response)
  end

  def self.get_route(rt_params)
    response = Faraday.new('http://www.mapquestapi.com/directions/v2/route').get do |f|
      f.params['key'] = ENV['map_quest_key']
      f.params['from'] = rt_params[:origin]
      f.params['to'] = rt_params[:destination]
    end

    ApiService.get_json(response)
  end
end
