class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :users
  has_many :quotes
  has_many :products

  after_create :create_products

  def create_products
    names = ["MRH", "AUTO", "SANTE"]
    names.each { |name| Product.create(team: self, name: name) }
  end
end
