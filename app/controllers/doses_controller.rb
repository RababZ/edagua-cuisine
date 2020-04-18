class DosesController < ApplicationController

  before_action :set_recipe, only: [:new, :create]

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
      render :new
    end
  end

  def destroy
  end

  private

  def set_recipe
    # @recipe = Recipe.find(params[:recipe_id])
    @recipe = policy_scope(Recipe).find(params[:recipe_id])
    authorize @recipe
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
