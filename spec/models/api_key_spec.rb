require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  describe 'relationships' do
    it {should belong_to(:bearer)}
  end

  describe "validations" do
    it 'validates' do
      create(:api_key)
      should validate_uniqueness_of(:bearer_id)
      should validate_presence_of(:bearer_id)
      should validate_presence_of(:bearer_type)
    end
  end
end
