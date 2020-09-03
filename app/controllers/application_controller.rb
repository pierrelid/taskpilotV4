class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # devise (authetification)
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # maquarade (log as)
  before_action :masquerade_user!

  # pundit (authorizations)
  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  private

  def skip_pundit?
    devise_controller? || is_a?(ActiveAdmin::BaseController)
  end

  protected

  def configure_permitted_parameters
    # strong devise params
  end
end
