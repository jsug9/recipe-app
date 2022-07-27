class RecipeFoodsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def index; end

  def show; end

  def create
    @food = Food.find(params[:food_id])
    @recipe_food = RecipeFood.new(quantity: params[:quantity])
    @recipe_food.recipe_id = @recipe.id
    @recipe_food.food_id = @food.id
    if @recipe_food.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipe)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
