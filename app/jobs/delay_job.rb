class DelayJob < ApplicationJob
  queue_as :default

  def perform(step_id, list_line_id)
    step = Step.find(step_id)
    list_line = ListLine.find(list_line_id)
    delay_in_second = step.delay * 24 * 3600
    list_line.update(
      waiting: true,
      waiting_start: DateTime.now,
      seconds_to_wait: delay_in_second,
    )
  end
end
