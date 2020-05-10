class StepsController < ApplicationController

  before_action :set_recipe, only: [:new, :create]
  before_action :set_step, only: [:edit, :update, :destroy]



  def new
    @step = Step.new
    authorize @step
  end

  def create
    @step = Step.new(step_params)
    @step.recipe = @recipe
    authorize @step
    if @step.save
      redirect_to recipe_path(@recipe)
    else
      # redirect_to edit_recipe_path(@recipe)
      :new
    end
  end

  def edit
  end

  def update
    authorize @step
    # @recipe.update(recipe_params)
    if @step.update(step_params)
      redirect_to recipe_path(@step.recipe_id)
    else
      render :edit
    end
  end

  def destroy
    authorize @step
    @recipe = @step.recipe
    @step.destroy
    redirect_to recipe_path(@recipe)
  end

  private

  def set_recipe
    # @recipe = Recipe.find(params[:recipe_id])
    @recipe = policy_scope(Recipe).find(params[:recipe_id])
    authorize @recipe
  end

  def set_step
    # @recipe = Recipe.find(params[:recipe_id])
    @step = policy_scope(Step).find(params[:id])
    authorize @step
  end

  def step_params
    params.require(:step).permit(:description)
  end
end
