# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@ingredient1 = Ingredient.create!(name: "Chicken", cost: 12)
@ingredient2 = Ingredient.create!(name: "Steak", cost: 15)
@ingredient3 = Ingredient.create!(name: "Salt", cost: 2)
@ingredient4 = Ingredient.create!(name: "Pepper", cost: 2)

@recipe1 = Recipe.create!(name: "Chicken Breast", complexity: 1, genre: "Meat")
@recipe2 = Recipe.create!(name: "Stirloin Steak", complexity: 1, genre: "Meat")

@recipe_ingredients1 = RecipeIngredient.create!(recipe: @recipe1, ingredient: @ingredient1)
@recipe_ingredients2 = RecipeIngredient.create!(recipe: @recipe2, ingredient: @ingredient2)
@recipe_ingredients3 = RecipeIngredient.create!(recipe: @recipe2, ingredient: @ingredient3)
@recipe_ingredients4 = RecipeIngredient.create!(recipe: @recipe2, ingredient: @ingredient4)