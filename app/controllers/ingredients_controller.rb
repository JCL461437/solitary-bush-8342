class IngredientsController < ApplicationController
  def index
    Ingredients.all
  end
end