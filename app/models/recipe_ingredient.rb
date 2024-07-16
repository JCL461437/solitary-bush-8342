class RecipeIngredient < ApplicationRecord

  belongs_to :recipe
  belongs_to :ingredient

  def self.find_recipe_ingredients(recipe)
    RecipeIngredient.joins(:ingredient).where(recipe_id: recipe).select("ingredients.*")
  end
end