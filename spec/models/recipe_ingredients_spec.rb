require "rails_helper"

RSpec.describe RecipeIngredient, type: :model do
  before :each do
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
  end

  describe "relationships" do
    it { should belong_to :recipe }
    it { should belong_to :ingredient }
  end

  describe "model tests" do
    it "should return all the ingredients for a recipe" do
      expect(RecipeIngredient.find_recipe_ingredients(@recipe2.id)).to eq([@recipe_ingredients2, @recipe_ingredients3, @recipe_ingredients4,])
    end
    it "should return all the ingredients for a recipe" do
      expect(RecipeIngredient.find_recipe_ingredients_cost(@recipe2.id)).to eq(19)
    end
  end
end