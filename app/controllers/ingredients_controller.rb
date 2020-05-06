class IngredientsController < ApplicationController

  before_action :set_recipe, only: [:new, :create]
  before_action :set_ingredient, only: [:edit, :update, :destroy]



  def new
    @ingredient = Ingredient.new
    authorize @ingredient
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.recipe = @recipe
    authorize @ingredient
    if @ingredient.save
      redirect_to recipe_path(@recipe)
    else
      # redirect_to edit_recipe_path(@recipe)
      :new
    end
  end

  def edit
  end

  def update
    authorize @ingredient
    # @recipe.update(recipe_params)
    if @ingredient.update(ingredient_params)
      redirect_to recipe_path(@ingredient.recipe_id)
    else
      render :edit
    end
  end

  def destroy
    authorize @ingredient
    @recipe = @ingredient.recipe
    @ingredient.destroy
    redirect_to recipe_path(@recipe)
  end

  private

  def set_recipe
    # @recipe = Recipe.find(params[:recipe_id])
    @recipe = policy_scope(Recipe).find(params[:recipe_id])
    authorize @recipe
  end

  def set_ingredient
    # @recipe = Recipe.find(params[:recipe_id])
    @ingredient = policy_scope(Ingredient).find(params[:id])
    authorize @ingredient
  end

  def ingredient_params
    params.require(:ingredient).permit(:quantity, :name)
  end
end
