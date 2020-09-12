class Api::V1::QuotesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def index
    @quotes = policy_scope(Quote)
  end

  private

  def render_error
    render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
  end
end
