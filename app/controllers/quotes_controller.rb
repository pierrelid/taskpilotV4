class QuotesController < ApplicationController
  def index
    @quotes = policy_scope(Quote)
  end
end
