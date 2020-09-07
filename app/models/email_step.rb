class EmailStep < Step
  validates :title, presence: true
  validates :body, presence: true
end
