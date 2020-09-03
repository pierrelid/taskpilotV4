class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # devise 
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?


    protected 

    def configure_permitted_parameters
        # storng devise params
    end 
end
