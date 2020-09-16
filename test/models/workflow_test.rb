require "test_helper"

class WorkflowTest < ActiveSupport::TestCase

  # workflows_execution

  test "must update lis line to finish if the next step doesn't exist" do
    workflow = workflows(:workflow_1_1)
    list = lists(:list_1_1)
    quote = quotes(:quote_1_1)
    step = steps(:step_1_1_3)
    list_line = ListLine.create(quote: quote, list: list, step: step)
    workflow.execution
    list_line.reload
    assert_nil list_line.step
    assert list_line.finish
    assert_not list_line.waiting
  end

  test "must update list_line to the next step if list_line.step is present" do
    workflow = workflows(:workflow_1_1)
    list = lists(:list_1_1)
    quote = quotes(:quote_1_1)
    step = steps(:step_1_1_1)
    list_line = ListLine.create(quote: quote, list: list, step: step)
    workflow.execution
    list_line.reload
    assert list_line.step.present?
    assert_equal step.position + 1, list_line.step.position
  end

  test "must update list_line to the fist step if list_line.step is nil" do
    workflow = workflows(:workflow_1_1)
    list = lists(:list_1_1)
    quote = quotes(:quote_1_1)
    list_line = ListLine.create(quote: quote, list: list)
    workflow.execution
    list_line.reload
    assert list_line.step.present?
    assert_equal 1, list_line.step.position
  end

  test "workflows_execution must return nil if workflowis inactive" do
    workflow = workflows(:workflow_1_2)
    assert_not workflow.execution
  end

  #  update_waiting_list_lines

  test "not update list_line if delay is not past" do
    freeze_time
    workflow = workflows(:workflow_1_1)
    list = workflow.list
    quote = quotes(:quote_1_1)
    list_line = ListLine.create(quote: quote, list: list, waiting: true, seconds_to_wait: 3600, waiting_start: DateTime.now - 10.minutes)
    workflow.update_waiting_list_lines
    list_line.reload
    assert list_line.waiting
    assert_equal 3600, list_line.seconds_to_wait
    assert_equal DateTime.now - 10.minutes, list_line.waiting_start
  end

  test "update list_line is delay is past" do
    workflow = workflows(:workflow_1_1)
    list = workflow.list
    quote = quotes(:quote_1_1)
    list_line = ListLine.create(quote: quote, list: list, waiting: true, seconds_to_wait: 3600, waiting_start: DateTime.now - 2.hours)
    workflow.update_waiting_list_lines
    list_line.reload
    assert_not list_line.waiting
    assert_equal 0, list_line.seconds_to_wait
    assert_nil list_line.waiting_start
  end

  # validations

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
