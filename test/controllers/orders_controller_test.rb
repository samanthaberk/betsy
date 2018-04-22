require "test_helper"

describe OrdersController do

  describe 'show' do

    it "succeeds if order exists" do
      get order_path(Order.first)
      must_respond_with :success
    end

    it "sends not_found if order doesn't exit" do
      order_id = Order.last.id + 1
      get order_path(order_id)

      must_respond_with :not_found
    end

  end

  describe 'new' do

    it 'responds with success' do
      get new_order_path
      must_respond_with :success
    end

  end

  describe 'create' do

    it "can add a valid order" do
      order_data = {
        status: nil,
        name: "Max",
        email: "max@adaacademy.com",
        # address zip
        address: "2627 107th Ave NE Bellevue, WA 98004",
        cc_num: "1234567891011121",
        expiry_date: "1020",
        cc_cvv: "123",
        # billing zip
        zip: "98004"
      }
      old_order_count = Order.count

      Order.new(order_data).must_be :valid?

      post orders_path, params: { order: order_data}

      must_respond_with :redirect
      must_redirect_to order_path(Order.last.id)

      Order.count.must_equal old_order_count + 1
      Order.last.name.must_equal order_data[:name]
    end

    it "won't add an invalid order" do
      order_data = {
        name: "Max",
        email: "max@adaacademy.com",
        # address zip
        address: "2627 107th Ave NE Bellevue, WA 98004",
        cc_num: nil,
        expiry_date: "1020",
        cc_cvv: "123",
        # billing zip
        zip: "98004",
      }
      old_order_count = Order.count

      Order.new(order_data).wont_be :valid?

      post orders_path, params: { order: order_data }

      must_respond_with :bad_request
      Order.count.must_equal old_order_count
    end

  end

end
