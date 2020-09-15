class Message < ApplicationRecord
  belongs_to :quote

  validates :body, presence: true

  scope :emails, -> { where(type: "EmailMessage") }
  scope :sms, -> { where(type: "SmsMessage") }
end
