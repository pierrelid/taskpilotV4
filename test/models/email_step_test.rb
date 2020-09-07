require "test_helper"

class EmailStepTest < ActiveSupport::TestCase
  test "valid if title is present" do
    email = EmailStep.new(title: "title")
    email.valid?
    assert_empty email.errors[:title]
  end

  test "invalid if title is not present" do
    email = EmailStep.new
    email.valid?
    assert_not email.errors[:title].empty?
  end

  test "valid if body is present" do
    email = EmailStep.new(body: "body")
    email.valid?
    assert_empty email.errors[:body]
  end

  test "invalid if body is not present" do
    email = EmailStep.new
    email.valid?
    assert_not email.errors[:body].empty?
  end
end
