class Product < ApplicationRecord
  belongs_to :team
  has_many :quotes

  validates :name, presence: true
end
