class LandingPagesController < ApplicationController
  def show
    @landing_page = LandingPage.find_by(slug: params[:slug])
    authorize @landing_page
    @dates = set_dates
    render layout: "landing_page"
  end

  def set_dates
    dates = []
    [*0..6].each do |offset|
      dates << Date.today + offset.day
      # créer les heures
    end
    dates
  end
end
