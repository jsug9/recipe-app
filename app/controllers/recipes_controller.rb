class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show; end

  def all; end

  def destroy
    @recipe = Recipe.find(params[:id])
    p @recipe
  end
end
