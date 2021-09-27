# frozen_string_literal: true

require 'rails_helper'

describe Book, :vcr do
  before(:each) do
    json = OpenLibraryService.get_books('denver,co')
    @book = Book.new(json[:docs].first)
  end

  it 'exists' do
    expect(@book).to be_a(Book)
  end

  it 'attributes' do
    expect(@book.isbn).to be_a(Array)
    expect(@book.title).to be_a(String)
    expect(@book.publisher).to be_a(Array)
  end
end
