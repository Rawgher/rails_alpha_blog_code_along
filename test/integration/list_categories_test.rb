require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Crock Pot")
    @category2 = Category.create(name: "Instant Pot")
  end

  test "should show categories" do
    get '/categories'
    # checking to see if the categories get their correct href paths
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
end
