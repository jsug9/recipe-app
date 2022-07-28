require 'rails_helper'

RSpec.describe 'Food Index Page', type: :feature do
  before(:each) do
    @user = User.new(
      name: 'Augusto',
      email: 'augusto@dev.com',
      password: '123456',
      password_confirmation: '123456',
      confirmed_at: Time.now,
      role: 'admin'
    )
    @user.skip_confirmation!
    @user.save!
    sign_in @user
    (1..5).each do |id|
      Food.create(
        name: "Food #{id}",
        measurement_unit: 'kgs',
        price: 2.5,
        quantity: 1000,
        user_id: @user.id
      )
    end
    visit foods_path
  end

  it 'should have an add food button' do
    expect(page).to have_link('Add Food')
  end
end
