require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
    get "/categories/new"
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: 'Crock Pot'}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Crock Pot", response.body
  end

  test "get new category form and reject invalid category" do
    get "/categories/new"
    assert_response :success
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: ' '}}
    end
    # matching certain elements of the page that would only show up if an error occurred
    assert_match "errors", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end
