class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.where(user_id: current_user)
  end

  def show
    @user = current_user
    @foods = Food.where(user_id: current_user)
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.foods
  end

  def all
    @recipes = Recipe.where(public: true)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end
end
