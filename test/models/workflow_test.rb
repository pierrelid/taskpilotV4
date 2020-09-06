require "test_helper"

class WorkflowTest < ActiveSupport::TestCase
  test "valid if name is present" do
    whorkflow = Workflow.new(name: "name")
    whorkflow.valid?
    assert_empty whorkflow.errors[:name]
  end

  test "invalid if name is not present" do
    whorkflow = Workflow.new
    whorkflow.valid?
    assert_not whorkflow.errors[:name].empty?
  end
end
