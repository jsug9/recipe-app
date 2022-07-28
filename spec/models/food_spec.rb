require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(
      name: "Augusto",
      email: "augusto@dev.com",
      password: "123456",
      password_confirmation: "123456",
      confirmed_at: Time.now,
      role: "admin")
    @user.skip_confirmation!
    @user.save!
    @food = Food.create(name: "Carrot", measurement_unit: "kgs", price: 2.5, quantity: 1000, user_id: @user.id)
  end

  describe 'Food Model Properties' do
    it 'name should be present' do
      @food.name = 'Carrot'
      expect(@food).to be_valid
    end

    it 'measurement_unit should be present' do
      @food.measurement_unit = 'kgs'
      expect(@food).to be_valid
    end

    it 'price should be present' do
      @food.price = nil
      expect(@food).to_not be_valid
    end

    it 'quantity should be present' do
      @food.quantity = nil
      expect(@food).to_not be_valid
    end

    it 'user_id should be present' do
      @food.user_id = nil
      expect(@food).to_not be_valid
    end
  end
end
