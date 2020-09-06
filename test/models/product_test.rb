require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "default_names must return default names" do
    assert_equal ["MRH", "AUTO", "SANTE"], Product.default_names
  end
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
