# frozen_string_literal: true

class BookSearchFacade
  def self.search(book_params)
    geo_json = MapQuestService.get_coordinates(book_params[:location])
    geo = Location.new(geo_json)
    forecast_json = OpenWeatherService.get_weather(geo)
    forecast = BookForecast.new(forecast_json)
    library_json = OpenLibraryService.get_books(book_params[:location])
    library = Library.new(library_json, book_params[:location], forecast)
    library.find_books(library_json, book_params[:quantity])
    library
  end
end
