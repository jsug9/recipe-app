class RecipeFoodsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def index; end

  def show; end

  def create
    @recipe_id = params[:recipe_id]
    @food_id = params[:food_id]
    @food = Food.find(@food_id)
    @recipe_food = RecipeFood.new(quantity: @food.quantity, food_id: @food_id, recipe_id: @recipe_id)
    redirect_to recipe_path(@recipe_id) if @recipe_food.save
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipe)
  end
end
