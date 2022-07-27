class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.where(user_id: current_user)
  end

  def show
    @user = current_user
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

  def add_ingredient
    @foods = current_user.foods
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.new(quantity: 0)
    @recipe_food.food_id = 

  end
end
