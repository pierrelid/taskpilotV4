class Step < ApplicationRecord
  belongs_to :workflow

  scope :emails, -> { where(type: "EmailStep") }
  scope :sms, -> { where(type: "SmsStep") }
  scope :delay_steps, -> { where(type: "DelayStep") }
end
