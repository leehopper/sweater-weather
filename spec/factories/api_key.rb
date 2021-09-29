# frozen_string_literal: true

FactoryBot.define do
  factory :api_key do
    bearer_id { create(:user).id }
    bearer_type { 'User' }
    token { Faker::Alphanumeric.unique.alphanumeric(number: 15, min_alpha: 5) }
  end
end
