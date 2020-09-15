class Workflow < ApplicationRecord
  belongs_to :list
  belongs_to :user

  has_many :steps, dependent: :destroy
  has_many :list_lines, through: :list

  validates :name, presence: true
end
