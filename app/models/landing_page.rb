class LandingPage < ApplicationRecord
  include SlugConcern

  belongs_to :team

  before_validation :set_slug
end
