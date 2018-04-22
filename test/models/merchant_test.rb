require "test_helper"

describe Merchant do

  describe "validations" do

    before do
      @merchant = merchants(:merchant_one)
    end

    it "is valid with all the required fields" do
      result = @merchant.valid?

      value(result).must_equal true
    end

    it "is invalid without a username" do
      @merchant.username = nil

      result = @merchant.valid?

      value(result).must_equal false
    end

    it "is invalid without an email" do
      @merchant.email = nil

      result = @merchant.valid?

      value(result).must_equal false
    end

    it "is invalid when there is a duplicate username" do
      duplicate = merchants(:merchant_two)
      duplicate.username = "merchant_one"

      result = duplicate.valid?

      value(result).must_equal false
    end

    it "is invalid when there is a duplicate email" do
      duplicate = merchants(:merchant_two)
      duplicate.email = "merchant_one@gmail.com"

      result = duplicate.valid?

      value(result).must_equal false
    end

  end

end
