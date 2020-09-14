require "test_helper"

class WorkflowTest < ActiveSupport::TestCase
  test "valid if list is present" do
    workflow = Workflow.new(list: List.last)
    workflow.valid?
    assert_empty workflow.errors[:list]
  end

  test "valid if name is present" do
    workflow = Workflow.new(name: "name")
    workflow.valid?
    assert_empty workflow.errors[:name]
  end

  test "invalid if name is not present" do
    workflow = Workflow.new
    workflow.valid?
    assert_not workflow.errors[:name].empty?
  end
end
