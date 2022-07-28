require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  before(:each) do
    User.destroy_all
    @user = User.new(
      name: 'Aaron',
      email: 'aaron@test.com',
      password: 'password',
      password_confirmation: 'password',
      role: 'admin'
    )
    @user.skip_confirmation!
    @user.save!
    Food.destroy_all
    food = Food.create(name: "Carrot", measurement_unit: "kgs", price: 2.5, quantity: 1000, user_id: @user.id)
  end

  describe 'GET /index' do
    before :each do
      visit new_user_session_path
      fill_in 'Email', with: 'aaron@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'returns a 200 status code' do
      visit foods_path 
      expect(page).to have_http_status(200)
    end
  end
end
