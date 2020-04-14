class ReviewsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @recipe = Recipe.find(params[:recipe_id])
    @review.recipe = @recipe
    if @review.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
