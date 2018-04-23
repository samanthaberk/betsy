require "test_helper"
require 'pry'

describe ReviewsController do
  describe 'new' do
    it "succeeds" do
      product_id = Product.first.id

      get new_product_review_path(product_id)

      must_respond_with :success
    end
  end

  describe 'create' do
    it "creates a review with valid data" do
      product_id = Product.first.id
      review_data = { rating: 5, description: 'review description', product_id: product_id  }

      old_review_count = Review.count

      Review.new(review_data).must_be :valid?
      post product_reviews_path(product_id), params: { review: review_data}

      must_respond_with :redirect
      must_redirect_to product_path(product_id)
      Review.count.must_equal old_review_count + 1
      Review.last.description.must_equal 'review description'
    end
  end
end
