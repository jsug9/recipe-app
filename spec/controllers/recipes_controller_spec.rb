require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  before (:each) do
    @user = User.new(name: "Augusto", email: "augusto@dev.com", password: "123456", password_confirmation: "123456", confirmed_at: Time.now, role: "admin")
    current_user = @user
    @user.skip_confirmation!
    @user.save!
    sign_in @user

    (1..3).each do |a| 
      a += 1.0 
      recipe = Recipe.create(name: "#{a}", preparation_time: a, cooking_time: a, description: "Very tasty dish description", user_id: @user.id, public: true)
    end
  end

  describe 'GET /index' do
    it 'response for index action status is correct' do
      get recipes_path
      expect(response).to have_http_status(200)
    end
  end

  it 'tests that the recipes of the user are found' do
    
    get recipes_path
    expect(response).to render_template 'index'
  end
end