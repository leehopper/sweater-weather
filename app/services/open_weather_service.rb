class OpenWeatherService < ApiService
  def self.get_weather(geo)
    response = Faraday.new('https://api.openweathermap.org/data/2.5/onecall').get do |f|
      f.params['appid'] = ENV['open_weather_key']
      f.params['lat'] = geo.lat
      f.params['lon'] = geo.long
      f.params['units'] = 'imperial'
      f.params['exclude'] = 'minutely'
      f.params['exclude'] = 'alerts'
    end

    ApiService.get_json(response)
  end
end
