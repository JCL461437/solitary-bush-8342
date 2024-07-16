class RecipesController < ApplicationController
  def show
    binding.pry
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = RecipeIngredient.where(recipe_id: :id)
  end
end