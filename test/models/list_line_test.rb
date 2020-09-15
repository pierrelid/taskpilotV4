require "test_helper"

class ListLineTest < ActiveSupport::TestCase
  setup do
    @team = teams(:one)
  end

  test "valid if step is not present" do
    list_line = ListLine.new
    list_line.valid?
    assert_empty list_line.errors[:step]
  end

  test "invalid if list_line alread exists" do
    list = @team.lists.lasto
    quote = Quote.find_by(team: @team, qualification: list.qualification, product: list.product)
    ListLine.create(list: list, quote: quote)
    list_line = ListLine.new(list: list, quote: quote)
    list_line.valid?
    assert_not list_line.errors[:list].empty?
  end

  test "valid if list_line, list scope quote doesn't exists" do
    list = @team.lists.last
    quote = Quote.find_by(team: @team, qualification: list.qualification, product: list.product)
    list_line = ListLine.new(list: list, quote: quote)
    list_line.valid?
    assert_empty list_line.errors[:list]
  end
end
