# frozen_string_literal: true

module Api
  module V1
    class BookSearchController < ApplicationController
      def index
        search = BookSearchFacade.search(book_params)
        render json: BooksSerializer.new(search)
      end

      private

      def book_params
        params.permit(:location, :quantity)
      end
    end
  end
end
