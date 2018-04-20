require "test_helper"

describe Product do
  describe 'validations' do
    before do

      @product = Product.new(
      name: 'headband',
      price: 8,
      available: 300)
    end

    it "can be created with all required fields" do
      # result = @product.valid?
      #
      # result.must_equal true
    end

    it "is invalid without a name" do
      @product.name = nil

      result = @product.valid?
      result.must_equal false
      @product.errors.messages.must_include :name
    end

    it "is invalid with a duplicate name" do
      dup_product = Product.first

      @product.name = dup_product.name

      result = @product.valid?
      result.must_equal false
      @product.errors.messages.must_include :name
    end

    it "it is invalid without a price" do
      @product.price = nil

      result = @product.valid?
      result.must_equal false
      @product.errors.messages.must_include :price
    end

    it "it is invaild if price is 0 or less" do
      @product.price = -2

      result = @product.valid?
      result.must_equal false
      @product.errors.messages.must_include :price
    end

    it "it is invalid if price is not an integer" do
      @product.price = 'hi'

      result = @product.valid?
      result.must_equal false
      @product.errors.messages.must_include :price

    end
  end
end
