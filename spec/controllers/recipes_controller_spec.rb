require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  before (:each) do
    @user = User.create(name: "Augusto", email: "augusto@dev.com", password: "123456", password_confirmation: "123456", confirmed_at: Time.now, role: "admin")
    current_user = @user
    @user.skip_confirmation!
    @user.save!
    sign_in @user
    (1..3).each do |a|  
      Recipe.create(name: "cool", preparation_time: 1.0, cooking_time: 1.0, description: "Very tasty dish description", user_id: @user.id, public: true)
    end
  end

  describe 'GET /index' do
    it 'response for index action status is correct' do
      get recipes_path
      expect(response).to have_http_status(200)
    end

    it 'should render the correct text' do
      get recipes_path
      expect(response.body).to include("Recipes")
    end
  end

  describe 'GET /show' do
    it 'response for show action status is correct' do
      recipe = Recipe.first
      get recipe_path(recipe.id)
      expect(response).to have_http_status(200)
    end
  end

  it 'tests that the recipes of the user are found' do
    
    get recipes_path
    expect(response).to render_template 'index'
  end

  it 'should render the correct text' do
    recipe = Recipe.first
    get recipe_path(recipe.id)
    expect(response.body).to include("cool")
  end
end