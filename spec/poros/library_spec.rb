# frozen_string_literal: true

require 'rails_helper'

describe Library, :vcr do
  before(:each) do
    @forecast = double
    @location = 'denver,co'

    @json = OpenLibraryService.get_books(@location)
    @library = Library.new(@json, @location, @forecast)
  end

  it 'exists' do
    expect(@library).to be_a(Library)
  end

  it 'attributes' do
    expect(@library.id).to eq(nil)
    expect(@library.forecast).to eq(@forecast)
    expect(@library.destination).to eq(@location)
    expect(@library.total_books_found).to be_a(Integer)
    expect(@library.books).to be_a(Array)
    expect(@library.books.count).to eq(0)
  end

  it '.find_books' do
    @library.find_books(@json, 5)

    expect(@library.books.count).to eq(5)

    @library.books.each do |book|
      expect(book).to be_a(Book)
    end
  end
end
