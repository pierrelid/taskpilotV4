class Step < ApplicationRecord
  belongs_to :workflow

  acts_as_list scope: :workflow

  scope :emails, -> { where(type: "EmailStep") }
  scope :sms, -> { where(type: "SmsStep") }
  scope :delay_steps, -> { where(type: "DelayStep") }
end
