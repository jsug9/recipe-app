class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show; end

  def all
  end

  def destroy
  end
end
