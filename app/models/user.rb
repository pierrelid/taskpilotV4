class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  belongs_to :team

  validates :first_name, presence: true
  validates :last_name, presence: true

  before_save :set_first_name
  before_save :set_last_name

  def set_first_name
    self.first_name = self.first_name.capitalize
  end

  def set_last_name
    self.last_name = self.last_name.capitalize
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
