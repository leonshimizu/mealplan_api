class MealPlan < ApplicationRecord
  validates :title, presence: true
  validates :recipes, presence: true
end
