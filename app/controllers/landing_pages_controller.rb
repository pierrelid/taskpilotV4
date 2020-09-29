class LandingPagesController < ApplicationController
  def show
    @landing_page = LandingPage.find(params[:id])
    authorize @landing_page
    render layout: "landing_page"
  end
end
