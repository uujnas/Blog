class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys:[:username, :first_name, :last_name])
        devise_parameter_sanitizer.permit(:account_update,keys: [:username, :first_name, :last_name])
        # devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:first_name,:last_name,:username,:email, :password, :remember_me)}
        # devise_parameter_sanitizer.for(:sign_in){ |u| u.permit(:email, :password)}
        # devise_parameter_sanitizer.for(:account_update){ |u| u.permit(:first_name,:last_name,:username,:email, :password, :remember_me)}
    end
end
