class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    # @review.assign_attributes(product_id: params[:product_id])
    @review.product_id = params[:product_id]

    if @review.save
      redirect_to product_path(@review.product_id)
    else
      flash[:error] = "You must submit a rating of 1-5 and a description."
      render :new
    end
  end

  private
  def review_params
    return params.require(:review).permit(:rating, :description)
  end
end
