class GeneralShoppingListController < ApplicationController
  def index
    @user = current_user
    @foods = Food.where(user_id: current_user).where(id: RecipeFood.pluck(:food_id))

    # get total foods value
    @total_foods_value = @foods.reduce(0) { |sum, food| sum + food.total_price }
  end
end
