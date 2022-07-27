class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.where(user_id: current_user)
  end

  def show
  p params
  p "HELOOOOO"
    @user = current_user
    @recipe = Recipe.find(params[:id])
  end
  def all; end

  def destroy
    @recipe = Recipe.find(params[:id])
    p @recipe
  end
end
