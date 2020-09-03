class QuotesController < ApplicationController
  def index
    @quotes = Quote.policy_scope(Quote)
  end
end
