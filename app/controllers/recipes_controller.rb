class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = RecipeIngredient.find_recipe_ingredients(params[:id])
    binding.pry
  end
end