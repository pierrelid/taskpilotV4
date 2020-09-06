class List < ApplicationRecord
  belongs_to :team
  belongs_to :product
  belongs_to :qualification

  has_one :workflow, dependent: :destroy

  validates :name, presence: true
  validates :product_id, uniqueness: { scope: :qualification_id, message: "this list alread exist" }
end
