class DelayJob < ApplicationJob
  queue_as :default

  def perform(step_id, list_line_id)
    step = Step.find(step_id)
    list_line = ListLine.find(list_line_id)
    list_line.update(waiting: true, seconds_to_wait: step.delay * 24 * 3600)
  end
end
