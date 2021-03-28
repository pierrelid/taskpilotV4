class LandingPagesController < ApplicationController
  def show
    @landing_page = LandingPage.find_by(slug: params[:slug])
    authorize @landing_page
    @dates = @landing_page.set_dates
    @hours = @landing_page.set_hours
    render layout: "landing_page"
  end
end
