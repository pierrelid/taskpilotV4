class Quote < ApplicationRecord
  include NameConcern

  email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  phone_regex = /\A(?:(?:\+|00)33|0)\s*[6-7](?:[\s.-]*\d{2}){4}\z/

  belongs_to :team
  belongs_to :product
  belongs_to :qualification

  has_many :list_lines, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, format: { with: phone_regex }
  validates :email, uniqueness: { scope: :team, message: "email already exists for this team" }, format: { with: email_regex }

  before_save :set_first_name
  before_save :set_last_name
end
