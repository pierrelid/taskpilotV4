class ListLine < ApplicationRecord
  belongs_to :list
  belongs_to :quote
  belongs_to :step, optional: true

  validates :list, uniqueness: { scope: :quote }
end
