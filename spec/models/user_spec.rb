require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it 'validates' do
      create(:user)
      should validate_uniqueness_of(:email)
      should validate_presence_of(:email)
      should validate_presence_of(:password)
      should have_secure_password
    end
  end
end
