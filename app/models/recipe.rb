class Recipe < ApplicationRecord
   validates :name, :complexity, :genre, presence: true

   has_many :recipe_ingredients
   has_many :ingredients, through: :recipe_ingredients

   def find_recipe_ingredients(recipe)
      RecipeIngredient.where(recipe_id: recipe)
   end
end
