# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email(domain: 'gmail') }
    password { Faker::Number.unique.number(digits: 5).to_s }

    trait :with_api_key do
      after(:create) do |user|
        create(:api_key, bearer_id: user.id)
      end
    end
  end
end
