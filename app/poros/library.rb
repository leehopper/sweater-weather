# frozen_string_literal: true

class Library
  attr_reader :id, :type, :destination, :forecast, :total_books_found, :books

  def initialize(json, location)
    @id = nil
    @type = 'books'
    @destination = location
    @forecast = nil
    @total_books_found = json[:num_found]
    @books = []
  end

  # def generate_daily_weather(json)
  #   json[:daily].first(5).each do |day|
  #     @daily_weather << DailyWeather.new(day)
  #   end
  # end
end
