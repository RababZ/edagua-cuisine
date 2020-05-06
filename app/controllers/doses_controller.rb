class DosesController < ApplicationController

  before_action :set_recipe, only: [:new, :create]
  before_action :set_dose, only: [:edit, :update, :destroy]



  def new
    @dose = Dose.new
    authorize @dose
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.recipe = @recipe
    authorize @dose
    if @dose.save
      redirect_to recipe_path(@recipe)
    else
      # redirect_to edit_recipe_path(@recipe)
      :new
    end
  end

  def edit
  end

  def update
    authorize @dose
    # @recipe.update(recipe_params)
    if @dose.update(dose_params)
      redirect_to recipe_path(@dose.recipe_id)
    else
      render :edit
    end
  end

  def destroy
    authorize @dose
    @recipe = @dose.recipe
    @dose.destroy
    redirect_to recipe_path(@recipe)
  end

  private

  def set_recipe
    # @recipe = Recipe.find(params[:recipe_id])
    @recipe = policy_scope(Recipe).find(params[:recipe_id])
    authorize @recipe
  end

  def set_dose
    # @recipe = Recipe.find(params[:recipe_id])
    @dose = policy_scope(Dose).find(params[:id])
    authorize @dose
  end

  def dose_params
    params.require(:dose).permit(:description)
  end
end
