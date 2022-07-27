class RecipeFoodsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.find(params[:food_id])
    @recipe_food = RecipeFood.new(quantity: params[:quantity])
    @recipe_food.recipe = @recipe
    @recipe_food.food = @food
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
    params.require(:recipe_food).permit(:quantity)
  end
end
