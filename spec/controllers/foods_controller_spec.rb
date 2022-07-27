require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  before :each do
    @user = User.new(
      name: 'Aaron',
      email: 'aaron@test.com',
      password: 'password',
    )
    @user.skip_confirmation!
    @user.save!
    @food = Food.create(
      name: "Carrot",
      measurement_unit: "kgs",
      price: 2.5,
      quantity: 1000,
      user_id: user.id
    )
  end
end
