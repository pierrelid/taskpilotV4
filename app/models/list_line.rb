class ListLine < ApplicationRecord
  belongs_to :list
  belongs_to :quote

  validates :list, uniqueness: { scope: :quote }
end
