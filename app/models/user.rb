class User < ApplicationRecord
  acts_as_token_authenticatable

  include NameConcern

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :masqueradable

  belongs_to :team
  has_many :workflows, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  before_save :set_first_name
  before_save :set_last_name
end
