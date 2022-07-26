class RecipesController < ApplicationController
  def index
    p current_user.name
    @user = current_user
    @recipes = Recipe.where(user_id: current_user)
  end

  def show; end

  def all
    @recipes = Recipe.all
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    p @recipe
  end
end
