class Message < ApplicationRecord
  belongs_to :quote

  scope :emails, -> { where(type: "EmailMessage") }
  scope :sms, -> { where(type: "SmsMessage") }
end
