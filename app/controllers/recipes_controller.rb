class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.where(user_id: current_user)
  end

  def show
    @user = current_user
    @foods = Food.where(user_id: current_user)
    # @foods = Food.where(user_id: current_user).where.not(id: RecipeFood.pluck(:food_id)) if we want to remove repeated food
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.foods
  end

  def all
    @recipes = Recipe.where(public: true)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    p @recipe
  end
end
