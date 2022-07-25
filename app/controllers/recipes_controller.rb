class RecipesController < ApplicationController
  def index; end

  def show; end

  def all
    @recipes = Recipe.all
    # p @recipes[0].name
    # p "HELLOOOOOOOOOOO"
  end
end
