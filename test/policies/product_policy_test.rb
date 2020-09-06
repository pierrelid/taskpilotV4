require "test_helper"

class ProductPolicyTest < ActiveSupport::TestCase
  setup do
    @user_one = users(:one)
    @user_two = users(:two)
  end

  test "quote policy scope users" do
    assert_equal 3, Pundit.policy_scope!(@user_one, Product).count
    assert_equal 3, Pundit.policy_scope!(@user_two, Product).count
  end
end
