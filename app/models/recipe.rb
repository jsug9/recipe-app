class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :preparation_time, :cooking_time, numericality: { greater_than: 0, only_float: true }
end
