# frozen_string_literal: true

class BookSearchFacade
  def self.search(book_params)
    json = OpenLibraryService.get_books(book_params[:location])
  end
end
