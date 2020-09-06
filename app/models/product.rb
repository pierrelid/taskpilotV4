class Product < ApplicationRecord
  belongs_to :team
  has_many :quotes, dependent: :destroy
  has_many :lists, dependent: :destroy

  validates :name, presence: true

  def self.default_names
    ["MRH", "AUTO", "SANTE"]
  end
end
