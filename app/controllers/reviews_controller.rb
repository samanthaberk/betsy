class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]

    if @review.save
      redirect_to product_path(@review.product_id)
    else
      flash[:error] = "You must submit a rating of 1-5 and a description."
      @product = Product.find_by(id: params[:product_id])
      render 'products/show', status: :bad_request
    end
  end

  private
  def review_params
    return params.require(:review).permit(:rating, :description)
  end
end
