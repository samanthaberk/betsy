require "test_helper"

describe SessionsController do
  describe 'auth_callback' do
    it "creates a new DB entry for a new user" do
      merchant = Merchant.new(
        provider: 'github',
        uid: 0000,
        email: 'test@test.org',
        username: 'testuser'
      )

      merchant.must_be :valid?
      old_merchant_count = Merchant.count

      login(merchant)

      Merchant.count.must_equal old_merchant_count + 1
      session[:merchant_id].must_equal Merchant.last.id
    end

    it "logs in existing merchant" do
      merchant = Merchant.first
      old_merchant_count = Merchant.count

      login(merchant)

      Merchant.count.must_equal old_merchant_count
      session[:merchant_id].must_equal Merchant.first.id
    end
  end
end
