class Product < ApplicationRecord
  belongs_to :team
  validates :name, presence: true
end
