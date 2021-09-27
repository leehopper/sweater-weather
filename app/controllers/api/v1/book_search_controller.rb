# frozen_string_literal: true

module Api
  module V1
    class BookSearchController < ApplicationController
      def index
        quantity = book_params[:quantity].to_i
        if !quantity.is_a?(Integer)
          render json: {status: "error", code: 400, message: 'quantity must be an integer'}
        elsif quantity < 1
          render json: {status: "error", code: 400, message: 'quantity must be greater than 0'}
        elsif quantity > 100
          render json: {status: "error", code: 400, message: 'quantity must be less than 100'}
        else
          search = BookSearchFacade.search(book_params)
          render json: BooksSerializer.new(search)
        end
      end

      private
      def book_params
        params.permit(:location, :quantity)
      end
    end
  end
end
