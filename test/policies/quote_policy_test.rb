require "test_helper"

class QuotePolicyTest < ActiveSupport::TestCase
  setup do
    @user_one = users(:one)
    @user_two = users(:two)
  end

  test "quote policy scope users" do
    assert_equal 5, Pundit.policy_scope!(@user_one, Quote).count
    assert_equal 15, Pundit.policy_scope!(@user_two, Quote).count
  end
end
