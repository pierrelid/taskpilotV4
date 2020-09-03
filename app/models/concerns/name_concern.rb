module NameConcern
  extend ActiveSupport::Concern

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def set_first_name
    self.first_name = first_name.capitalize
  end

  def set_last_name
    self.last_name = last_name.capitalize
  end
end
