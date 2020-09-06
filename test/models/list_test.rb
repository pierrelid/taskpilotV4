require "test_helper"

class ListTest < ActiveSupport::TestCase
  test "invalid if list already exists" do
    list = List.new(name: "name", product: products(:one_mrh), qualification: qualifications(:qualification_1_1))
    list.valid?
    assert_not list.errors[:product_id].empty?
  end

  test "valid if list doesn't already exists" do
    list = List.new(name: "name", product: products(:one_mrh), qualification: qualifications(:qualification_1_2))
    list.valid?
    assert_empty list.errors[:product_id]
  end

  test "valid if name is present" do
    list = List.new(name: "name")
    list.valid?
    assert_empty list.errors[:name]
  end

  test "invalid if name is not present" do
    list = List.new
    list.valid?
    assert_not list.errors[:name].empty?
  end
end
