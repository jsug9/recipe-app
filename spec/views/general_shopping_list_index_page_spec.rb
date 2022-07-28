require 'rails_helper'

RSpec.describe 'General Shopping List Index Page', type: :feature do
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
    recipe = Recipe.create(name: "Tasty dish", preparation_time: 1.1, cooking_time: 2.1, description: "Very tasty dish description", user_id: @user.id, public: true)
    Food.all.each do |food|
      RecipeFood.create(quantity: 2, recipe_id: recipe.id, food_id: food.id)
    end
    visit general_shopping_list_index_path
  end

  it 'should have 5 foods' do
    expect(page).to have_content('Food 1')
    expect(page).to have_content('Food 2')
    expect(page).to have_content('Food 3')
    expect(page).to have_content('Food 4')
    expect(page).to have_content('Food 5')
  end

  it 'should show the amount of food in the shopping list' do
    expect(page).to have_content('Amount of food items to buy: 5')
  end
end
