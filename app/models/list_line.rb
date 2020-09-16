class ListLine < ApplicationRecord
  belongs_to :list
  belongs_to :quote
  belongs_to :step, optional: true

  validates :list, uniqueness: { scope: :quote }

  def step_execution
    if self.step.present?
      case self.step.type
      when "EmailStep"
        SendEmailJob.perform_later(self.quote.id, self.step.id, self.step.workflow.user.id)
      when "SmsStep"
        SendSmsJob.perform_later(self.quote.id, self.step.id)
      when "DelayStep"
        DelayJob.perform_later(self.step.id, self.id)
      else
      end
    end
  end
end
