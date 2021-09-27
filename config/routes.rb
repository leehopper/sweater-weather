# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index]
      resources :book_search, path: '/book-search', only: [:index]
    end
  end
end
