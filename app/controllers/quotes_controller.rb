class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = policy_scope(Quote)
  end

  def new
    @quote = Quote.new
    authorize @quote
  end

  def create
    @quote = Quote.new(quote_params.merge(team: current_user.team))
    authorize @quote
    @quote.save ? redirect_to(quote_path(@quote)) : render(:new)
  end

  def show
  end

  def edit
  end

  def update
    if @quote.update(quote_params)
      redirect_to quote_path(@quote)
    else
      render :edit
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path
  end

  private

  def quote_params
    params.require(:quote).permit(:first_name, :last_name, :email, :phone, :product_id, :qualification_id)
  end

  def set_quote
    @quote = Quote.find(params[:id])
    authorize @quote
  end
end
