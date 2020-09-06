class List < ApplicationRecord
  belongs_to :team
  belongs_to :product
  belongs_to :qualification

  validates :name, presence: true
end
