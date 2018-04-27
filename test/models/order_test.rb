require "test_helper"

describe Order do

  describe "validations" do
    before do
      @order = orders(:basic_order)
      @progress_order = Order.new(status: "in progress")
    end

    it 'can be created with all required fields' do
      result = @order.valid?
      result.must_equal true
    end

    # WHEN IN PROGRESS IT....
    it "requires a name" do
      @progress_order.valid?.must_equal false
      @progress_order.errors.messages.must_include :name
    end

    # email
    it "requires an email" do
      @progress_order.valid?.must_equal false
      @progress_order.errors.messages.must_include :email
    end

    it "requires an @ sign in the email when in progress" do
      @progress_order.email = "emailnoatsign"
      @progress_order.valid?.must_equal false
      @progress_order.errors.messages.must_include :email
    end

    # address
    it "requires an address" do
      @progress_order.valid?.must_equal false
      @progress_order.errors.messages.must_include :address
    end

    it "requires a number at beginning of address" do
      @progress_order.address = "not starting w/ numbers"
      @progress_order.valid?.must_equal false
      @progress_order.errors.messages.must_include :address
    end

    # cc_num
    it "requires a cc_num" do
      @progress_order.valid?.must_equal false
      @progress_order.errors.messages.must_include :cc_num
    end

    it "requires 16 digits" do
      @progress_order.cc_num = "111222"
      @progress_order.valid?.must_equal false
      @progress_order.errors.messages.must_include :cc_num
    end

    it "requires digits only - test with letters only" do
      @progress_order.cc_num = "no numbersssssss"
      @progress_order.valid?.must_equal false
      @progress_order.errors.messages.must_include :cc_num
    end

    it "requires digits only - test with some letters" do
      @progress_order.cc_num = "1letters23456789"
      @progress_order.valid?.must_equal false
      @progress_order.errors.messages.must_include :cc_num
    end

    # expiry_date
    # it "requires a expiry_date" do
    #   @blank_order.valid?.must_equal false
    #   @blank_order.errors.messages.must_include :expiry_date
    # end
    #
    # it "requires 4 digits" do
    #   @order.expiry_date = "113"
    #   @order.valid?.must_equal false
    #   @order.errors.messages.must_include :expiry_date
    # end
    #
    # it "requires digits only - test with letters only" do
    #   @order.expiry_date = "xxxx"
    #   @order.valid?.must_equal false
    #   @order.errors.messages.must_include :expiry_date
    # end
    #
    # it "requires digits only - test with some letters" do
    #   @order.expiry_date = "1x2x"
    #   @order.valid?.must_equal false
    #   @order.errors.messages.must_include :expiry_date
    # end

    # cc_cvv
    it "requires a cc_cvv" do
      @progress_order.valid?.must_equal false
      @progress_order.errors.messages.must_include :cc_cvv
    end

    it "requires 3 digits" do
      @progress_order.cc_cvv = "1234"
      @progress_order.valid?.must_equal false
      @progress_order.errors.messages.must_include :cc_cvv
    end

    it "requires digits only - test with letters only" do
      @progress_order.cc_cvv = "xxx"
      @progress_order.valid?.must_equal false
      @progress_order.errors.messages.must_include :cc_cvv
    end

    it "requires digits only - test with some letters" do
      @progress_order.cc_cvv = "1x2"
      @progress_order.valid?.must_equal false
      @progress_order.errors.messages.must_include :cc_cvv
    end

    # zip
    it "requires a zip" do
      @progress_order.valid?.must_equal false
      @progress_order.errors.messages.must_include :zip
    end

    it "requires digits only - test with letters only" do
      @progress_order.zip = "xxxxx"
      @progress_order.valid?.must_equal false
      @progress_order.errors.messages.must_include :zip
    end

    it "requires digits only - test with some letters" do
      @progress_order.zip = "1x3x5"
      @progress_order.valid?.must_equal false
      @progress_order.errors.messages.must_include :zip
    end
  end

  # describe "relations" do
  #   it "has a merchant" do
  #   end
  #
  #   it "has a list of products" do
  #     # order = orders(:order_one)
  #     # order.must_respond_to :products
  #     # order.products.each do |product|
  #     # product.must_be_kind_of Product
  #   end
  # end

end
