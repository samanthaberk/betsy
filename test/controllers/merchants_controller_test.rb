require "test_helper"

describe MerchantsController do

  describe "index" do
    it "sends a success reponse when there are many merchants" do
      Merchant.count.must_be :>, 0
      get merchants_path
      must_respond_with :success
    end

    it "sends a success response when there are no merchants" do
      # destroy all products before destroying all merchants due to foreign key constraint
      Product.destroy_all
      Merchant.destroy_all
      Merchant.count.must_equal 0
      get merchants_path
      must_respond_with :success
    end
  end

  describe "new" do
    it "sends a success response" do
      get new_merchant_path
      must_respond_with :success
    end
  end

  describe  "create" do
    it "creates a merchant with valid data" do
      old_merchant_count = Merchant.count

      merchant_data = {
        username: "test user",
        email: 'email@gmail.com'
      }

      merchant = Merchant.new(merchant_data)

      post merchants_path, params: { merchant: merchant_data}

      must_respond_with :redirect
      must_redirect_to merchant_path(Merchant.last.id)

      Merchant.count.must_equal old_merchant_count + 1
    end

    it "renders error for missing data" do
      old_merchant_count = Merchant.count

      merchant_data = {email: 'email@gmail.com'}

      merchant = Merchant.new(merchant_data)
      Merchant.new(merchant_data).wont_be :valid?

      post merchants_path, params: { merchant: merchant_data}

      must_respond_with :bad_request
      Merchant.all.count.must_equal old_merchant_count
    end
  end

  describe "show" do
    it "sends a success response if the merchant exists in the database" do
      merchant = Merchant.first

      merchant.must_be :valid?

      get merchant_path(merchant)

      must_respond_with :success
    end

    it "sends not_found if the merchant does not exist in the database" do
      merchant = Merchant.last.id + 1

      get merchant_path(merchant)

      must_respond_with :not_found
    end
  end

end
