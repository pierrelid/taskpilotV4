require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "valid if name is present" do
    product = Product.new(name: "name")
    product.valid?
    assert_empty product.errors[:name]
  end

  test "invalid if name is not present" do
    product = Product.new
    product.valid?
    assert_not product.errors[:name].empty?
  end
end
