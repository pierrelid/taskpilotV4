class Product < ApplicationRecord
  belongs_to :team
  has_many :quotes, dependent: :destroy

  validates :name, presence: true
end
