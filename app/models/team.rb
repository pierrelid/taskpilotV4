class Team < ApplicationRecord
  include SlugConcern

  has_many :users, dependent: :destroy

  has_many :quotes, dependent: :destroy
  has_many :list_lines, through: :quotes

  has_many :products, dependent: :destroy

  has_many :qualifications, dependent: :destroy
  has_one :landing_page, dependent: :destroy

  has_many :lists, dependent: :destroy
  has_many :workflows, through: :lists
  has_many :active_workflows, -> { where(active: true) }, through: :lists, source: :workflow

  before_validation :set_slug

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  after_create :create_products
  after_create :create_qualifications
  after_create :create_lists
  after_create :create_landing_page

  def create_landing_page
    LandingPage.create(team: self)
  end

  def create_qualifications
    Qualification.default_names.each { |name| Qualification.create(team: self, name: name, default: true) }
    Qualification.find_by(team: self, name: Qualification.initial_name).update(initial: true)
  end

  def create_lists
    Qualification.default_names_for_lists.each do |qualification_name|
      Product.default_names.each do |product_name|
        qualification = Qualification.find_by(name: qualification_name, team: self)
        product = Product.find_by(name: product_name, team: self)
        List.create(name: "#{product_name} : #{qualification_name}", product: product, qualification: qualification, team: self)
      end
    end
  end

  def create_products
    Product.default_names.each { |name| Product.create(team: self, name: name, default: true) }
  end
end
