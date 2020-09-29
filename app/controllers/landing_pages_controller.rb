class LandingPagesController < ApplicationController
  def show
    @landing_page = LandingPage.find_by(slug: params[:slug])
    authorize @landing_page
    render layout: "landing_page"
  end
end
