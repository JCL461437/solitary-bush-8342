class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = RecipeIngredient.find_recipe_ingredients(params[:id])
    @recipe_ingredients_cost = RecipeIngredient.find_recipe_ingredients_cost(params[:id])
  end
end