class Team < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :quotes, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :qualifications, dependent: :destroy
  has_many :lists, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  after_create :create_products
  after_create :create_qualifications

  def create_qualifications
    default_qualification_names.each { |name| Qualification.create(team: self, name: name) }
  end

  def create_products
    default_product_names.each { |name| Product.create(team: self, name: name) }
  end

  def default_product_names
    ["MRH", "AUTO", "SANTE"]
  end

  def default_qualification_names
    ["Jamais démarché", "Lead chaud", "Rendez-vous pris", "Sans suite"]
  end
end
