require "test_helper"

class StepTest < ActiveSupport::TestCase

  # change_list_lines_step

  test "change list line step must assign to the next step" do
    step = steps(:step_1_1_1)
    list = lists(:list_1_1)
    quote_1 = quotes(:quote_1_1)
    quote_2 = quotes(:quote_1_2)
    list_line_1 = ListLine.create(step: step, quote: quote_1, list: list)
    list_line_2 = ListLine.create(step: step, quote: quote_2, list: list)
    step.change_list_lines_step
    list_line_1.reload
    list_line_2.reload
    assert_equal list_line_1.step, steps(:step_1_1_2)
    assert_equal list_line_2.step, steps(:step_1_1_2)
  end

  # next_step

  test "next_step must return the next step" do
    step = steps(:step_1_1_1)
    assert_equal steps(:step_1_1_2), step.next_step
  end

  test "next_step must return nil if next_step doesn't exists" do
    step = steps(:step_1_1_3)
    assert_nil step.next_step
  end
end
