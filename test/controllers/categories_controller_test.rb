require "test_helper"

describe CategoriesController do

  describe 'index' do

    it "sends a success response when there are many categories" do
      Category.count.must_be :>, 0

      get categories_path

      must_respond_with :success
    end

    it "sends a success response when there are no categories" do
      Category.delete_all
      
      Category.count.must_equal 0

      get categories_path

      must_respond_with :success
    end

  end

end
