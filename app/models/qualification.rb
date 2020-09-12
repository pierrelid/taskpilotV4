class Qualification < ApplicationRecord
  belongs_to :team
  has_many :quotes, dependent: :destroy
  has_many :lists, dependent: :destroy

  validates :name, presence: true

  def self.default_names_for_lists
    ["Jamais démarché"]
  end

  def self.initial_name
    "Jamais démarché"
  end

  def self.default_names
    ["Jamais démarché", "Lead chaud", "Rendez-vous pris", "Sans suite"]
  end
end
