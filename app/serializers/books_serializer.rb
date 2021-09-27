# frozen_string_literal: true

class BooksSerializer
  include FastJsonapi::ObjectSerializer
  attributes :destination, :forecast, :total_books_found, :books
end
