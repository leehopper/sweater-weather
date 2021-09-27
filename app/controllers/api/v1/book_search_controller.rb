# frozen_string_literal: true

module Api
  module V1
    class BookSearchController < ApplicationController
      def index
        quantity = book_params[:quantity].to_i
        if quantity < 1 || quantity > 100
          render json: { status: 'error', code: 400, message: 'quantity must be greater than 1 and less than 100' }
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
