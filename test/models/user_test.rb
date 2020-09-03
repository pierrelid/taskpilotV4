require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "first_name shoud be parse" do
    team = teams(:one)
    user = User.create(team: team, first_name: "john", last_name: "lennon", email: "test@test.com", password: "123456")
    user.reload
    assert_equal "John", user.first_name
    assert_equal "Lennon", user.last_name
  end

  test "set_first_name must return capitalize first_name" do
    user = User.new(first_name: "john")
    assert_equal "John", user.set_first_name
  end

  test "set_first_name must return capitalize last_name" do
    user = User.new(last_name: "lennon")
    assert_equal "Lennon", user.set_last_name
  end

  test "full_name must return the full_name" do
    user = User.new(first_name: "John", last_name: "Lennon")
    assert_equal "John Lennon", user.full_name
  end

  test "invalid if last_name is not present" do
    user = User.new
    user.valid?
    assert_not user.errors[:last_name].empty?
  end

  test "valid if last_name is present" do
    user = User.new(last_name: "last_name")
    user.valid?
    assert_empty user.errors[:last_name]
  end

  test "invalid if first_name is not present" do
    user = User.new
    user.valid?
    assert_not user.errors[:first_name].empty?
  end

  test "valid if first_name is present" do
    user = User.new(first_name: "last_name")
    user.valid?
    assert_empty user.errors[:first_name]
  end

  test "invalid if team is not present" do
    user = User.new
    user.valid?
    assert_not user.errors[:team].empty?
  end

  test "valid if team is present" do
    team = teams(:one)
    user = User.new(team: team)
    user.valid?
    assert_empty user.errors[:team]
  end
end
