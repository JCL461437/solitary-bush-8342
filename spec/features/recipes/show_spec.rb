require "rails_helper"

RSpec.describe 'recipes show' do

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

  describe 'as a visitor' do
    describe 'when I visit /recipes/:id' do 
      it 'displays the recipes name, complexity and genre and I see a list of the names of the ingredients for the recipe' do
        
        visit "/recipes/#{@recipe2.id}"

        expect(page).to have_content(@recipe2.name)
        expect(page).to have_content("Complexity: #{@recipe2.complexity}")
        expect(page).to have_content("Genre: #{@recipe2.genre}")

        expect(page).to have_content("#{@ingredient2.name}: #{@ingredient2.cost}")
        expect(page).to have_content("#{@ingredient3.name}: #{@ingredient3.cost}")
        expect(page).to have_content("#{@ingredient4.name}: #{@ingredient4.cost}")
        # within ("") do
        # end
      end

      it 'total cost of ingredients' do
        
        visit "/recipes/#{@recipe2.id}"

        expect(page).to have_content("Total Cost: 19")
      end
    end
  end
end