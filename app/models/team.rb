class Team < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :quotes, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :qualification, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  after_create :create_products

  def create_products
    names = ["MRH", "AUTO", "SANTE"]
    names.each { |name| Product.create(team: self, name: name) }
  end
end
