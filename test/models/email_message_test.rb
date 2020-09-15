require "test_helper"

class EmailMessageTest < ActiveSupport::TestCase
  test "valid if body is not present" do
    message = EmailMessage.new(title: "title")
    message.valid?
    assert_empty message.errors[:title]
  end

  test "invalid if body is not present" do
    message = EmailMessage.new
    message.valid?
    assert_not message.errors[:title].empty?
  end
end
