require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # each test gets scrubbed so need to do @ for each test

  # this method helps to avoid repeat code
  # it will run with each test
  def setup
    @category = Category.new(name: "Sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do

  end

  test "name should not be too long" do

  end

  test "name shoudl not be too short" do

  end

end
