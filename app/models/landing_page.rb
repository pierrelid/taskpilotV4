class LandingPage < ApplicationRecord
  include SlugConcern

  belongs_to :team
  before_validation :set_slug

  def set_hours
    [
      "9:30",
      "10:00",
      "10:30",
      "11:00",
      "11:30",
      "12:00",
      "12:30",
      "13:00",
      "13:30",
      "14:00",
      "14:30",
      "15:00",
      "15:30",
      "16:00",
      "16:30",
      "17:00",
      "17:30",
      "18:00",
    ]
  end

  def set_dates
    dates = []
    [*0..6].each { |offset| dates << Date.today + offset.day }
    dates
  end
end
