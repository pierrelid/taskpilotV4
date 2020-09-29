class Event < ApplicationRecord
  validates :start, presence: true
  validates :end, presence: true

  belongs_to :user
end
