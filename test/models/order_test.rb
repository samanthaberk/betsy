require "test_helper"

describe Order do
  let(:order) { Order.new }

  it "must be valid" do
    value(order).must_be :valid?
  end

  describe "relations" do
    it "has a merchant" do
    end

    it "has a list of products" do
      # order = orders(:order_one)
      # order.must_respond_to :products
      # order.products.each do |product|
      # product.must_be_kind_of Product
    end
  end

  describe "validations" do
    it "requires a name" do
      order = Order.new
      order.valid?.must_equal false
      order.errors.messages.must_include :name
    end

    it "requires an email" do
    end

    it "requires an address" do
    end

    it "requires a cc_num" do
    end

    it "requires a expiry_date" do
    end

    it "requires a cc_cvv" do
    end

    it "requires a zip" do
    end

  end

end
