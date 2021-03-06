# frozen_string_literal: true

class OpenLibraryService < ApiService
  def self.get_books(location)
    response = Faraday.new('https://openlibrary.org/search.json').get do |f|
      f.params['q'] = location
    end

    ApiService.get_json(response)
  end
end
