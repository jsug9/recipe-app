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
    @food = Food.create()
  end
end
