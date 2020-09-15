class Step < ApplicationRecord
  belongs_to :workflow
  has_many :list_lines

  acts_as_list scope: :workflow

  scope :emails, -> { where(type: "EmailStep") }
  scope :sms, -> { where(type: "SmsStep") }
  scope :delay_steps, -> { where(type: "DelayStep") }
end
