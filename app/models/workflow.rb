class Workflow < ApplicationRecord
  belongs_to :list
  has_many :steps

  validates :name, presence: true
end
