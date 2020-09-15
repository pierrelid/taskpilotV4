require "test_helper"

class MessageTest < ActiveSupport::TestCase
  test "valid if body is not present" do
    message = Message.new(body: "body")
    message.valid?
    assert_empty message.errors[:body]
  end

  test "invalid if body is not present" do
    message = Message.new
    message.valid?
    assert_not message.errors[:body].empty?
  end
end
