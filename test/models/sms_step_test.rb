require "test_helper"

class SmsStepTest < ActiveSupport::TestCase
  test "valid if body is present" do
    sms = SmsStep.new(body: "body")
    sms.valid?
    assert_empty sms.errors[:body]
  end

  test "invalid if body is not present" do
    sms = SmsStep.new
    sms.valid?
    assert_not sms.errors[:body].empty?
  end
end
