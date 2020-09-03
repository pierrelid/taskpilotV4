class Quote < ApplicationRecord
  include NameConcern

  email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  belongs_to :team

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, format: { with: email_regex }

  before_save :set_first_name
  before_save :set_last_name
end
