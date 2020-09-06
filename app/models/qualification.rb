class Qualification < ApplicationRecord
  validates :name, presence: true

  belongs_to :team
  has_many :quotes
end
