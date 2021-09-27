# frozen_string_literal: true

require 'rails_helper'

describe 'OpenLibraryServiceSpec', :vcr do
  it 'returns symbolized json from open library api' do
    response = OpenLibraryService.get_books('denver,co')

    expect(response).to be_a(Hash)
    expect(response).to have_key(:numFound)
    expect(response).to have_key(:docs)
  end
end
