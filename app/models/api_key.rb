# frozen_string_literal: true

class ApiKey < ApplicationRecord
  belongs_to :bearer, polymorphic: true
  validates :bearer_id, uniqueness: true, presence: true
  validates :bearer_type, presence: true
end
