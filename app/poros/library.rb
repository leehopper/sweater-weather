# frozen_string_literal: true

class Library
  attr_reader :id, :type, :destination, :forecast, :total_books_found, :books

  def initialize(json, location, forecast)
    @id = nil
    @type = 'books'
    @destination = location
    @forecast = forecast
    @total_books_found = json[:num_found]
    @books = []
  end

  def find_books(json, quantity)
    json[:docs].first(quantity.to_i).each do |book|
      @books << Book.new(book)
    end
  end
end
