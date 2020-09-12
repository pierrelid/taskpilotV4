class Api::V1::QuotesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def index
    @quotes = policy_scope(Quote)
  end

  def create
    @team = User.find_by(authentication_token: params["user_token"]).team
    @product = Product.find_by(team: team, name: contact_params["product"])
    @qualification = Qualification.find_by(team: team, initial: true)
    @quote = Quote.new(contact_params.merge(team: @team, product: @product, qualification: @qualification))
    authorize @quote
    if @quote.save
      render_new_quote
    else
      render_error
    end
  end

  private

  def render_new_quote
    render json: {
      first_name: @quote.first_name,
      last_name: @quote.last_name,
      email: @quote.email,
      phone: @quote.phone,
    }
  end

  def contact_params
    params.require(:quote).permit(:first_name, :last_name, :phone, :email, :product)
  end

  def render_error
    render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
  end
end
