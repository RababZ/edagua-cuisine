class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query] && params[:query].present?
      @recipes = policy_scope(Recipe).search_by_name_and_description(params[:query])
    else
      @recipes = policy_scope(Recipe)
    end
  end

  def show
    @review = Review.new
  end

  def my_recipes
    @recipes = policy_scope(Recipe).where(user: current_user)
    authorize Recipe
  end

  def new
    @recipe = Recipe.new
    authorize @recipe
    @recipe.ingredients.build
    @recipe.steps.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    authorize @recipe
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
    authorize @recipe
  end

  def update
    authorize @recipe
    # @recipe.update(recipe_params)
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    authorize @recipe
    @recipe.destroy
    redirect_to recipes_path
  end


  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def recipe_params
    params.require(:recipe)
          .permit(
            :name, :category, :description, :active_time, :idle_time, :difficulty, :serving_size, :steps, :photo,
            ingredients_attributes: [:id, :quantity, :name, :_destroy],
            steps_attributes: [:id, :description, :_destroy]
            )
  end
end
