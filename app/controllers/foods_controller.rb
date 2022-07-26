class FoodsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @foods = @user.foods
  end

  def show; end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
