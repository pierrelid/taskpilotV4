class SmsStep < Step
  validates :body, presence: true
end
