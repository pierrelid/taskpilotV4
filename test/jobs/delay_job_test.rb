require "test_helper"

class DelayJobTest < ActiveJob::TestCase
  setup do
    @list = lists(:list_1_1)
    @step = steps(:step_1_1_2)
    @quote = quotes(:quote_1_1)
    @list_line = ListLine.create(step: @step, quote: @quote, list: @list)
  end

  test "must set time to wait in second" do
    DelayJob.perform_now(@step.id, @list_line.id)
    @list_line.reload
    seconds_to_wait = @step.delay * 24 * 3600
    assert_equal seconds_to_wait, @list_line.seconds_to_wait
  end

  test "must set list_line to waitind at true" do
    DelayJob.perform_now(@step.id, @list_line.id)
    @list_line.reload
    assert @list_line.waiting
  end
end
