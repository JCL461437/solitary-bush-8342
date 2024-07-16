require "rails_helper"

RSpec.describe 'ingredients index' do

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
    describe 'when I visit /ingredients' do 
      it 'I see a list of all the ingredients including their name and cost' do
        
        visit "/ingredients"

        expect(page).to have_content("Ingredient List:")
        expect(page).to have_content(@ingredient1.name)
        expect(page).to have_content(@ingredient2.name)
        expect(page).to have_content(@ingredient3.name)
        expect(page).to have_content(@ingredient4.name)
        expect(page).to have_content("Ingredient List:")
        expect(page).to have_content(@ingredient1.cost)
        expect(page).to have_content(@ingredient2.cost)
        expect(page).to have_content(@ingredient3.cost)
        expect(page).to have_content(@ingredient4.cost)
        # within ("") do
        # end
      end
    end
  end
end