require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  test "full_name must return full_name of quote" do
    quote = Quote.new(first_name: "john", last_name: "lennon")
    assert_equal "John Lennon", quote.full_name
  end
  test "invalid if team is not present" do
    quote = Quote.new
    quote.valid?
    assert_not quote.errors[:team].empty?
  end

  test "valid if team is present" do
    quote = Quote.new(team: teams(:one))
    quote.valid?
    assert_empty quote.errors[:team]
  end

  test "invalid if email is not a good format" do
    emails = [
      "email",
      "email@",
      "@email",
      "@email.com",
      "email@.com",
    ]
    emails.each do |email|
      quote = Quote.new(email: email)
      quote.valid?
      assert_not quote.errors[:email].empty?
    end
  end

  test "invalid if email is not present" do
    quote = Quote.new
    quote.valid?
    assert_not quote.errors[:email].empty?
  end

  test "valid if email is present" do
    quote = Quote.new(email: "email@email.com")
    quote.valid?
    assert_empty quote.errors[:email]
  end

  test "invalid if email already exists for same team" do
    quote = Quote.new(email: teams(:one).quotes.last.email, team: teams(:one))
    quote.valid?
    assert_not quote.errors[:email].empty?
  end

  test "valid if email is present and already exists but for anothe compagnie" do
    quote = Quote.new(email: teams(:one).quotes.last.email, team: teams(:two))
    quote.valid?
    assert_empty quote.errors[:email]
  end

  test "invalid if first_name is not present" do
    quote = Quote.new
    quote.valid?
    assert_not quote.errors[:first_name].empty?
  end

  test "valid if first_name is present" do
    quote = Quote.new(first_name: "first_name")
    quote.valid?
    assert_empty quote.errors[:first_name]
  end

  test "invalid if last_name is not present" do
    quote = Quote.new
    quote.valid?
    assert_not quote.errors[:last_name].empty?
  end

  test "valid if last_name is present" do
    quote = Quote.new(last_name: "last_name")
    quote.valid?
    assert_empty quote.errors[:last_name]
  end
end
