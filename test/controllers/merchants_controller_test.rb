require "test_helper"

describe MerchantsController do

  describe "index" do
    it "sends a success reponse when there are many merchants" do
      Merchant.count.must_be :>, 0
      get merchants_path
      must_respond_with :success
    end

    it "sends a success response when there are no merchants" do
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
    it "can add a valid merchant to the database" do
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
  end

end
