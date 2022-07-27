class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  belongs_to :user

  validates :quantity, numericality: { greater_than: 0, only_float: true }
end
