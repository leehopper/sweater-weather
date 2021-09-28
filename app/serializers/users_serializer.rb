# frozen_string_literal: true

class UsersSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email

  attributes :api_key do |object|
    object.api_keys.first.token
  end
end
