class List < ApplicationRecord
  belongs_to :team
  belongs_to :product
  belongs_to :qualification

  has_many :list_lines, dependent: :destroy
  has_many :quotes, through: :list_lines

  has_one :workflow, dependent: :destroy

  validates :name, presence: true
  validates :product_id, uniqueness: { scope: :qualification_id, message: "this list alread exist" }

  def create_list_lines
    quotes = Quote.where(team: self.team, qualification: self.qualification, product: self.product)
    quotes.each { |quote| ListLine.create(list: self, quote: quote) unless ListLine.find_by(list: self, quote: quote).present? }
  end
end
