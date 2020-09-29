class Event < ApplicationRecord
  validates :start, presence: true
  validates :end, presence: true

  enum kind: [:physical, :call]

  belongs_to :user
end
