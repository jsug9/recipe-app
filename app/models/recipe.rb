class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :preparation_time, :cooking_time, numericality: { greater_than: 0, only_float: true }

  def total_price
    total_price = 0
    recipe_foods.each do |recipe_food|
      total_price += recipe_food.food.price * recipe_food.quantity
    end
    total_price
  end
end
