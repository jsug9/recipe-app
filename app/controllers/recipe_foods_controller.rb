class RecipeFoodsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def index; end

  def show; end

  def create
    @recipe_id = params[:recipe_id]
    @food_id = params[:food_id]
    @recipe_food = RecipeFood.new(quantity: params[:quantity], food_id: @food_id, recipe_id: @recipe_id)
    if @recipe_food.save
      redirect_to recipe_path(@recipe_id)
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipe)
  end

  # private

  # def recipe_food_params
  #   params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  # end
end
