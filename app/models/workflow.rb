class Workflow < ApplicationRecord
  belongs_to :list
  has_many :steps
  has_many :list_lines, through: :list

  validates :name, presence: true
end
