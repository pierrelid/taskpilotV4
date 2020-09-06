require "test_helper"

class ListTest < ActiveSupport::TestCase
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
