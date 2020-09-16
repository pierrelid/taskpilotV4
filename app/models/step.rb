class Step < ApplicationRecord
  belongs_to :workflow
  has_many :list_lines, dependent: :nullify

  acts_as_list scope: :workflow

  scope :emails, -> { where(type: "EmailStep") }
  scope :sms, -> { where(type: "SmsStep") }
  scope :delay_steps, -> { where(type: "DelayStep") }

  before_destroy :change_list_lines_step

  def change_list_lines_step
    self.list_lines.each { |e| e.update(step: next_step) }
  end

  def next_step
    self.workflow.steps.find_by(position: self.position + 1)
  end
end
