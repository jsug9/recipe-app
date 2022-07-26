class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show; end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
