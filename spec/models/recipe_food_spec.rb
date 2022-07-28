RSpec.describe RecipeFood, type: :model do
  before(:each) do
    user = User.create(name: 'Augusto', email: 'augusto@dev.com', password: '123456', password_confirmation: '123456',
                       confirmed_at: Time.now, role: 'admin')
    recipe = Recipe.create(name: 'tasty', preparation_time: 1.0, cooking_time: 1.0,
                           description: 'Very tasty dish description', user_id: user.id, public: true)
    food = Food.create(name: 'Carrot', measurement_unit: 'kgs', price: 2.5, quantity: 1000, user_id: user.id)
    @recipe_food = RecipeFood.create(quantity: 2, recipe_id: recipe.id, food_id: food.id)
  end

  it 'Recipe should be valid' do
    expect(@recipe_food.food).to be_valid
  end
end
