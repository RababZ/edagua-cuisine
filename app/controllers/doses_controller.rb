class DosesController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @dose = Dose.new
  end

  def create
    # @dose = Dose.new(dose_params)
    # @recipe = Recipe.find(params[:recipe_id])
    # @dose.recipe = @recipe
    # if @dose.save
    #   redirect_to recipe_path(@recipe)
    # else
    #   render :new
    # end
  end

  def destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
